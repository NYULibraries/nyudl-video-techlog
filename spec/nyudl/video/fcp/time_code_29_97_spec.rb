require 'spec_helper'

describe Nyudl::Video::Fcp::TimeCode_29_97 do
  describe ".frames_to_time" do
    it "handles 0 properly" do
      expect(Nyudl::Video::Fcp::TimeCode_29_97.frames_to_time_in_sec(0)).to eql('00:00:00.000')
    end
    it "handles non-zero values properly" do
      expect(Nyudl::Video::Fcp::TimeCode_29_97.frames_to_time_in_sec(352857)).to eql('03:16:13.673')
    end
  end
end
