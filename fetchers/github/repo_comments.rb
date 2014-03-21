module Fetchers
  module Github

    class RepoComments
      include Celluloid

      def initialize(cfg)
      end

      def fetch
        ["I solved this issue with TCPSocket in Celluloid", "Twitter streaming client now accepts injection of other TCP socket classes"]
      end
    end

  end
end
