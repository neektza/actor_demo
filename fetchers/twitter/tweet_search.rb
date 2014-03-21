module Fetchers
  module Twitter

    class TweetSearch
      include Celluloid

      def initialize(cfg)
      end
      
      def fetch
        %w(tweet1 some_other_tweet third_tweet)
      end
    end

  end
end
