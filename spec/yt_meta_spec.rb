require "spec_helper"
require "yt_meta"
require "support/api_config"

describe YtMeta do
  uri_without_api_key = VCR.request_matchers.uri_without_param(:key)

  context "#fetch_data" do
    it "returns a hash of video data" do
      VCR.use_cassette("valid_id", match_requests_on: [uri_without_api_key]) do
        data = described_class.fetch_data(
          youtube_id: "C93umZAYYII", parts: "snippet"
        )

        expect(data).to have_key "snippet"
        expect(data["snippet"]["title"]).to eq(
          "REAL WORLD: Whiterun - Episode 4 (Skyrim machinima)"
        )
      end
    end

    it "raises an error when no id or url is given" do
      expect {
        described_class.fetch_data
      }.to raise_error YtMeta::YoutubeFetchError
    end

    it "raises an error when an invalid ID is given" do
      VCR.use_cassette("no_video", match_requests_on: [uri_without_api_key]) do
        expect {
          described_class.fetch_data(youtube_id: "novideo", parts: "snippet")
        }.to raise_error YtMeta::YoutubeFetchError
      end
    end
  end
end
