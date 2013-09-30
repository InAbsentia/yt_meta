module YtMeta
  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end
  end

  class Configuration
    attr_accessor :api_key, :parts

    def initialize
      @parts = %w[id snippet player contentDetails recordingDetails statistics status topicDetails]
    end
  end
end
