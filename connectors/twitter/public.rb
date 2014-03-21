module Connectors
  module Twitter

    class Public
      include Celluloid::IO

      def initialize(cfg)
        # @config = cfg
        # @client = ::Twitter::Streaming::Client.new({tcp_socket_klass: Celluloid::IO::TCPSocket, ssl_socket_klass: Celluloid::IO::SSLSocket}) do |config|
        #   config.consumer_key        = @config.fetch(:oauth).fetch(:consumer_key)
        #   config.consumer_secret     = @config.fetch(:oauth).fetch(:consumer_secret)
        #   config.access_token        = @config.fetch(:oauth).fetch(:token)
        #   config.access_token_secret = @config.fetch(:oauth).fetch(:token_secret)
        # end

        @cnt = 0
      end

      def listen
        every(1) do
          @cnt += 1
          yield "Tweet #{@cnt}"
        end
      end
    end

  end
end
