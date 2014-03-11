require 'spec_helper'

describe Nyudl::Video::Techlog::TimeCode_29_97 do
  describe ".frames_to_time_index" do
    it "handles 0 properly" do
      expect(Nyudl::Video::Techlog::TimeCode_29_97.frames_to_time_index(0)).to eql('00:00:00.000')
    end
    it "handles non-zero values properly" do
      expect(Nyudl::Video::Techlog::TimeCode_29_97.frames_to_time_index(352857)).to eql('03:16:13.673')
    end
  end
  describe ".time_index_to_frames" do
    it "handles 0 properly" do
      expect(Nyudl::Video::Techlog::TimeCode_29_97.time_index_to_frames('0')).to eql(0)
    end
    it "handles 00:00:00.000 properly" do
      expect(Nyudl::Video::Techlog::TimeCode_29_97.time_index_to_frames('00:00:00.000')).to eql(0)
    end
    it "handles non-zero values properly" do
      expect(Nyudl::Video::Techlog::TimeCode_29_97.time_index_to_frames('03:16:13.673')).to eql(352857)
    end
  end
end
