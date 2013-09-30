require "open-uri"
require "yt_meta/configuration"

module YtMeta
  class ApiUri
    def initialize(youtube_id, parts=nil)
      @youtube_id = youtube_id
      @parts = Array(parts || default_parts)
    end

    def read
      api_uri.read
    end

    def to_s
      api_uri.to_s
    end

  private
    def config
      @config ||= YtMeta.configuration
    end

    def api_key
      config.api_key
    end

    def default_parts
      config.parts
    end

    def api_base_url
      'https://www.googleapis.com/youtube/v3/videos'
    end

    def api_uri
      uri = URI.parse(api_base_url)
      uri.query = query_string
      uri
    end

    def query_string
      query_hash = {id: @youtube_id, key: api_key}
      query_hash[:part] = @parts.join(',') unless @parts.empty?
      query_hash.map {|key, val| "#{key}=#{val}"}.join("&")
    end
  end
end
