module Fetchers
  module Meetup

    class Events
      include Celluloid

      def initialize(cfg)
      end

      def fetch
        %w(ruby::meetup::first zgphp python_meetup)
      end
    end

  end
end
