module Connectors
  module Meetup

    class Rsvps
      include Celluloid::IO

      def initialize(cfg)
        # @client = ::Meetup::Streaming::Client.new(tcp_socket_klass: Celluloid::IO::TCPSocket)
        @cnt = 0
      end


      def listen
        every(2) do
          @cnt += 1
          yield "RSVP #{@cnt}"
        end
      end
    end

  end
end
