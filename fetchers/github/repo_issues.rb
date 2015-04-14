module Fetchers
  module Github

    class RepoIssues
      include Celluloid

      def initialize(cfg)
      end

      def fetch
        ["TCPSocket doesn't work with celluloid", "Twitter streaming is broken in twitter gem"]
      end
    end

  end
end
