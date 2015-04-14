module Fetchers
  module Meetup

    class Rsvps
      include Celluloid

      def initialize(cfg)
      end

      def fetch
        %w(meetup_rsvp1, meetup_rsvp2, meetup_rsvp3)
      end
    end

  end
end
