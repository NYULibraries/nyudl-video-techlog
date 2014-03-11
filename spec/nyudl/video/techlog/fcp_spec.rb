require 'spec_helper'

describe Nyudl::Video::Techlog::Fcp do
  let(:techlog_single_valid)  { Nyudl::Video::Techlog::Fcp.new('test/single-valid.xml') }
  let(:techlog_no_end_marker) { Nyudl::Video::Techlog::Fcp.new('test/single-invalid-missing-clip-end-marker.xml') }
  let(:techlog_multiple_valid){ Nyudl::Video::Techlog::Fcp.new('test/multiple-valid.xml') }
  let(:techlog_multiple_no_inline_end_marker){ Nyudl::Video::Techlog::Fcp.new('test/multiple-invalid-missing-clip-end-marker.xml') }
  let(:techlog_multiple_no_inline_begin_marker){ Nyudl::Video::Techlog::Fcp.new('test/multiple-invalid-missing-clip-begin-marker.xml') }

  describe '.new' do
    it 'returns an object of the correct class' do
      expect(techlog_single_valid).to be_instance_of(Nyudl::Video::Techlog::Fcp)
    end
    context "when file doesn't exist" do
      it "raises an exception" do
        expect {Nyudl::Video::Techlog::Fcp.new('asdfadfadsf')}.to raise_error(Errno::ENOENT)
      end
    end
    context "with a valid file" do
      it "does not raise an exception" do
        expect {Nyudl::Video::Techlog::Fcp.new('test/single-valid.xml')}.not_to raise_error
      end
    end
    context "with an invalid file missing last end marker" do
      it "does raises an exception" do
        expect {techlog_no_end_marker}.to raise_error(RuntimeError, /ended in invalid state/)
      end
    end
    context "with an invalid file missing in-line end marker" do
      it "does raises an exception" do
        expect {techlog_multiple_no_inline_end_marker}.to raise_error(RuntimeError, "invalid transition to :clip_in")
      end
    end
    context "with an invalid file missing in-line begin marker" do
      it "does raises an exception" do
        expect {techlog_multiple_no_inline_begin_marker}.to raise_error(RuntimeError, "invalid transition to :clip_out")
      end
    end


  end

  describe "#valid?" do
    context "with a valid fcp file" do
      it "returns true" do
        expect(techlog_single_valid).to be_valid
      end
    end
  end

  describe "#clips" do
    context "with a valid fcp file" do
      it "returns an Array" do
        expect(techlog_single_valid.clips.class).to eql(Array)
      end
      it "returns an Array of Clips" do
        expect(techlog_single_valid.clips[0].class).to eql(Nyudl::Video::Techlog::Clip)
      end
    end
    context "with a valid fcp file with a single clip" do
      it "returns an Array with one element" do
        expect(techlog_single_valid.clips.count).to eq(1)
      end
      it "clip has expected values" do
        clip = techlog_single_valid.clips[0]
        expect(clip.frame_in).to eq(1350)
        expect(clip.frame_out).to eq(85659)
      end
    end
    context "with a valid fcp file with a multiple clips" do
      it "returns an Array with multiple elements" do
        expect(techlog_multiple_valid.clips.count).to eq(3)
      end
      it "selected clip has expected values" do
        clip = techlog_multiple_valid.clips[1]
        expect(clip.frame_in).to eq(29109)
        expect(clip.frame_out).to eq(62895)
      end
    end
  end

  describe "#notes" do
    context "with a valid fcp file" do
      it "returns the correct notes" do
        notes = "TEST_FILE\n" +
          "      00:00:00;00 interviewee off-center\n" +
          "      00:17:xx;xx second interviewee somewhat out of frame especially hands\n" +
          "      00:36:xx;xx third interviewee somewhat out of frame especially hands"
        expect(techlog_multiple_valid.notes).to eq(notes)
      end
    end
  end
end


# check clip counts for single and multiple
# check that invalid transition raised for missing end marker
# check that "ended in invalid state" exception is raised
# sample clip in/out values


=begin
  let(:techlog) { Nyudl::Video::Techlog::Fcp.new('test/single-valid.xml') }
  let(:techlog_single) { Nyudl::Video::Techlog::Fcp.new('test/single-valid.xml') }
  describe '.new' do
    it 'returns an object of the correct class' do
      expect(techlog_single_valid).to be_instance_of(Nyudl::Video::Techlog::Fcp)
    end
    it 'raises an exception if file cannot be found' do
      expect {Nyudl::Video::Techlog::Fcp.new('asdfadfadsf')}.to raise_error(Errno::ENOENT)
    end
    it 'raises an exception if file is not readable'
  end
=end
#    describe '#clips' do
#     context 'with a single clip' do
# #      expect clip count to be correct
#     end
#     context 'with multiple clips
#   end

#   context 'with a single clip' do
#     context '#clips' do
#       it 'returns the correct clip array'
#     end
#     context '#digi_notes' do
#       it 'returns the correct digitization notes'
#     end
#     context '#
#     it 'returns the correct digitization notes'

#   context 'with multiple clips'
#   context 'with a clip missing an end marker'
#   context 'with an unrecognized marker name'
  #    describe '#clips' do
  #     context 'with a single clip' do
  # #      expect clip count to be correct
  #     end
  #     context 'with multiple clips
  #   end

  #   context 'with a single clip' do
  #     context '#clips' do
  #       it 'returns the correct clip array'
  #     end
  #     context '#digi_notes' do
  #       it 'returns the correct digitization notes'
  #     end
  #     context '#
  #     it 'returns the correct digitization notes'

  #   context 'with multiple clips'
  #   context 'with a clip missing an end marker'
  #   context 'with an unrecognized marker name'


=begin
  clip logic:
  + take time in value if name = beginning of video etc.


=end

