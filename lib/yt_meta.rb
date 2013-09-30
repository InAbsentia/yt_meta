require "yt_meta/version"
require "yt_meta/fetcher"
require "yt_meta/youtube_id"
require "yt_meta/api_uri"

module YtMeta
  def self.fetch_data(youtube_id: "", parts: nil)
    youtube_id = YoutubeId.parse_url(youtube_id)
    api_uri = ApiUri.new(youtube_id, parts)
    Fetcher.new(youtube_id, api_uri).fetch
  end
end
