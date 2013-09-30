require "spec_helper"
require "yt_meta/api_uri"
require "support/api_config"

describe YtMeta::ApiUri do
  describe "#to_s" do
    it "returns a proper Youtube API URL" do
      api_url = described_class.new("C93umZAYYII")
      api_key = YtMeta.configuration.api_key
      expect(api_url.to_s).to eq "https://www.googleapis.com/youtube/v3/videos?id=C93umZAYYII&key=#{api_key}&part=#{all_parts.join(',')}"
    end
  end

  context "specifying parts" do
    it "includes all parts if none are given" do
      api_uri = described_class.new("C93umZAYYII")
      all_parts.each {|part_name|
        expect(api_uri.to_s).to match(/#{part_name}/)
      }
    end

    it "includes only the given part" do
      api_uri = described_class.new("C93umZAYYII", "snippet")
      expect(api_uri.to_s).to match(/snippet/)
      expect(api_uri.to_s).to_not match(/player/)
    end

    it "includes only the given parts" do
      api_uri = described_class.new("C93umZAYYII", %w[snippet player])
      expect(api_uri.to_s).to match(/snippet/)
      expect(api_uri.to_s).to match(/player/)
      expect(api_uri.to_s).to_not match(/contentDetails/)
    end
  end

private
  def all_parts
    YtMeta.configuration.parts
  end
end
