class Poller
  include Celluloid

  def initialize(cfg, fetcher_klass)
    @config = cfg
    @fetcher = fetcher_klass.new_link(cfg)

    poll
  end

  def poll
    Celluloid.logger.info "Polling #{endpoint}"
    every(x_seconds) { fetch }
  end

  def fetch
    p @fetcher.fetch
  end

  private
  def x_seconds
    @config.fetch(:interval) { 10 }
  end

  def endpoint
    @config.fetch(:url)
  end
end
