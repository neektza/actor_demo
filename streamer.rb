class Streamer
  include Celluloid::IO

  def initialize(cfg, connector_klass)
    @config = cfg
    @connector = connector_klass.new_link(cfg)

    stream
  end

  def stream
    Celluloid.logger.info "Streaming #{endpoint}"
    connect
  end

  def connect
    @connector.listen do |resp|
      p resp
    end
  end

  private
  def endpoint
    @config.fetch(:url)
  end
end
