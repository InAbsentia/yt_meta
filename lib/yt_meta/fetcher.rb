require "yt_meta/youtube_fetch_error"
require "json"

module YtMeta
  class Fetcher
    def initialize(youtube_id, api_uri)
      @youtube_id = youtube_id
      @api_uri = api_uri
    end

    def fetch
      response = JSON.parse(@api_uri.read)

      raise_fetch_error response["message"] if response["error"]
      raise_not_found if response["items"].empty?

      response["items"].first
    end

  private
    def raise_fetch_error(message)
      raise YoutubeFetchError, message
    end

    def raise_not_found
      raise YoutubeFetchError, "Video with ID #{@youtube_id} was not found."
    end
  end
end
