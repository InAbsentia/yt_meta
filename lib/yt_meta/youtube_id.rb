require "yt_meta/youtube_fetch_error"

module YtMeta
  class YoutubeId
    class << self
      def parse_url(input)
        input = input.to_s.strip
        raise_invalid_input_error if input.empty?

        extract_id(input) || input
      end

    private
      def extract_id(input)
        if matches = input.match(youtube_id_regex)
          matches[:id]
        end
      end

      def youtube_id_regex
        /(youtu)(be\.com|\.be)\/(watch\?.*v=)?(?<id>[a-zA-Z0-9\-\_]*)/i
      end

      def raise_invalid_input_error
        raise YoutubeFetchError, "You must provide a valid video ID or URL"
      end
    end
  end
end
