require "spec_helper"
require "yt_meta/fetcher"

describe YtMeta::Fetcher do
  it "raises an import error when initialized with a non-existent ID" do
    api_uri = double(:api_uri, read: error_json)

    expect { described_class.new("novideo", api_uri).fetch }
      .to raise_error YtMeta::YoutubeFetchError
  end

  context "with a valid Youtube ID" do
    it "fetches correct video metadata" do
      api_uri = double(:api_uri, read: video_json)

      data = described_class.new("C93umZAYYII", api_uri).fetch
      expect(data).to be_a Hash
      expect(data["snippet"]["title"]).to eq("Title!")
    end
  end

private
  def error_json
    JSON.generate(error: "error", message: "No video")
  end

  def video_json
    JSON.generate(items: [{snippet: {title: "Title!"}}])
  end
end
