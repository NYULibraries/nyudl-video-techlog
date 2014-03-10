require 'spec_helper'

describe Nyudl::Video::Fcp::TimeCode_29_97 do
  describe ".frames_to_time_in_sec" do
    it "handles 0 properly" do
      expect(Nyudl::Video::Fcp::TimeCode_29_97.frames_to_time_in_sec(0)).to eql('00:00:00.000')
    end
    it "handles non-zero values properly" do
      expect(Nyudl::Video::Fcp::TimeCode_29_97.frames_to_time_in_sec(352857)).to eql('03:16:13.673')
    end
  end
  describe ".time_in_sec_to_frames" do
    it "handles 0 properly" do
      expect(Nyudl::Video::Fcp::TimeCode_29_97.time_in_sec_to_frames('0')).to eql(0)
    end
    it "handles 00:00:00.000 properly" do
      expect(Nyudl::Video::Fcp::TimeCode_29_97.time_in_sec_to_frames('00:00:00.000')).to eql(0)
    end
    it "handles non-zero values properly" do
      expect(Nyudl::Video::Fcp::TimeCode_29_97.time_in_sec_to_frames('03:16:13.673')).to eql(352857)
    end
  end
end
