require "spec_helper"
require "yt_meta/youtube_id"

describe YtMeta::YoutubeId do
  it "returns the input when not given a URL" do
    described_class.parse_url("C93umZAYYII").should == "C93umZAYYII"
  end

  it "returns the ID when given a valid full URL" do
    id = described_class.parse_url("http://www.youtube.com/watch?v=1eCbGrMfQ-g")
    expect(id).to eq "1eCbGrMfQ-g"
  end

  it "returns the ID when given a valid short URL" do
    id = described_class.parse_url("http://www.youtu.be/1eCbGrMfQ-g")
    expect(id).to eq "1eCbGrMfQ-g"
  end

  it "raises an error when given an empty string" do
    expect { described_class.parse_url("") }.to raise_error YtMeta::YoutubeFetchError
  end

  it "raises an error when given a string made up only of spaces" do
    expect { described_class.parse_url("    ") }.to raise_error YtMeta::YoutubeFetchError
  end
end
