require 'spec_helper'

describe Nyudl::Video::Techlog::TimeCode_29_97 do
  describe ".frames_to_time_index" do
    it "handles 0 properly" do
      expect(Nyudl::Video::Techlog::TimeCode_29_97.frames_to_time_index(0)).to eql('00:00:00.000')
    end
    it "handles a small non-zero value properly" do
      expect(Nyudl::Video::Techlog::TimeCode_29_97.frames_to_time_index(5)).to eql('00:00:00.167')
    end
    it "handles non-zero values properly" do
      expect(Nyudl::Video::Techlog::TimeCode_29_97.frames_to_time_index(352857)).to eql('03:16:13.674')
    end
    context "when frame_count contains characters other than digits" do
      it "raises an exception" do
        expect {Nyudl::Video::Techlog::TimeCode_29_97.frames_to_time_index(0.0)}.to raise_error(RuntimeError, /incorrect format/)
      end
    end
  end
  describe ".time_index_to_frames" do
    it "handles 00:00:00.000 properly" do
      expect(Nyudl::Video::Techlog::TimeCode_29_97.time_index_to_frames('00:00:00.000')).to eql(0)
    end
    it "handles a small non-zero value properly" do
      expect(Nyudl::Video::Techlog::TimeCode_29_97.time_index_to_frames('00:00:00.167')).to eql(5)
    end
    it "handles non-zero values properly" do
      expect(Nyudl::Video::Techlog::TimeCode_29_97.time_index_to_frames('03:16:13.674')).to eql(352857)
    end
    it "should be symmetrical" do
      time_idx = '01:01:48.842'
      frames   = Nyudl::Video::Techlog::TimeCode_29_97.time_index_to_frames(time_idx)
      expect(Nyudl::Video::Techlog::TimeCode_29_97.frames_to_time_index(frames)).to eq(time_idx)
    end
    context "when time_index is not well formatted" do
      it "raises an exception" do
        expect {Nyudl::Video::Techlog::TimeCode_29_97.time_index_to_frames("asdf.0")}.to raise_error(RuntimeError, /incorrect format/)
      end
    end
  end

end
