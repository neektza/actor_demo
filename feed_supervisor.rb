require_relative 'configurator'
require_relative 'poller'
require_relative 'streamer'
require_relative 'connectors/all'
require_relative 'fetchers/all'

class FeedSupervisor
  include Celluloid

  def initialize(feed_name)
    @feed_name = feed_name
    @config = Configurator.new(ENV['ENV']).config(@feed_name)
    boot
  end

  def boot
    endpoints_supervisor = SupervisionGroup.new

    polling_endpoints.each do |name, cfg|
      endpoints_supervisor.supervise_as(name, Poller, *[cfg, fetchers(@feed_name, name, cfg)])
    end

    streaming_endpoints.each do |name, cfg|
      endpoints_supervisor.supervise_as(name, Streamer, *[cfg, connectors(@feed_name, name, cfg)])
    end
  end

  private

  def polling_endpoints
    @config[:polling] || []
  end

  def streaming_endpoints
    @config[:streaming] || []
  end

  def fetchers(feed_name, endpoint_name, endpoint_config)
    if feed_name == :github
      if endpoint_name.to_s =~ /issues/
        Fetchers::Github::RepoIssues
      elsif endpoint_name.to_s =~ /comments/
        Fetchers::Github::RepoComments
      end
    elsif feed_name == :meetup
      if endpoint_name == :events
        Fetchers::Meetup::Events
      elsif endpoint_name == :rsvps
        Fetchers::Meetup::Rsvps
      end
    elsif feed_name == :twitter
      if endpoint_name == :tweet_search
        Fetchers::Twitter::TweetSearch
      end
    end
  end

  def connectors(feed_name, endpoint_name, endpoint_config) 
    if feed_name == :twitter
      if endpoint_name == :public
        Connectors::Twitter::Public
      end
    elsif feed_name == :meetup
      if endpoint_name == :rsvps
        Connectors::Meetup::Rsvps
      end
    end
  end

  private
  def user_stream?(cfg)
    cfg[:url] =~ /user\.json/
  end



end
