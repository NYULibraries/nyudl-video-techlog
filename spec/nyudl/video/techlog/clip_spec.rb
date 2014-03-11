require 'spec_helper'

describe Nyudl::Video::Techlog::Clip do
  let(:clip) { Nyudl::Video::Techlog::Clip.new({}) }
  let(:invalid_frame_count_in) { Nyudl::Video::Techlog::Clip.new(name: 'start of video') }
  let(:invalid_frame_count_out){ Nyudl::Video::Techlog::Clip.new(name: 'end of video') }
  let(:valid_frame_count_in)   { Nyudl::Video::Techlog::Clip.new(name: 'start of video', in: 5) }
  let(:valid_frame_count_out)  { Nyudl::Video::Techlog::Clip.new(name: 'end of video',   in: 10) }
  let(:valid_notes_no_note)    { Nyudl::Video::Techlog::Clip.new(name: 'QC') }
  let(:valid_notes_with_note)  { Nyudl::Video::Techlog::Clip.new(name: 'QC', comment: 'digi notes') }


  describe '.new' do
    it 'returns an object of the correct class' do
      expect(clip).to be_instance_of(Nyudl::Video::Techlog::Clip)
    end
  end

  describe '#valid?' do
    context 'before parameters have been processed' do
      it 'is invalid' do
        expect(clip.valid?).to be false
      end
    end
    context 'when @frame_count_in >= @frame_count_out' do
      it 'is invalid' do
        clip.process_params(name: 'start of video', in: 15)
        clip.process_params(name: 'end of video',   in: 10)
        expect(clip.valid?).to be false
      end
    end
    context 'when @frame_count_in not processed, @frame_count_out processed' do
      it 'is invalid' do
        clip.process_params(name: 'end of video',   in: 15)
        expect(clip.valid?).to be false
      end
    end
    context 'when @frame_count_in processed, @frame_count_out not processed' do
      it 'is invalid' do
        clip.process_params(name: 'start of video',   in: 10)
        expect(clip.valid?).to be false
      end
    end
    context 'when @frame_count_in processed and @frame_count_out processed' do
      it 'is valid' do
        clip.process_params(name: 'start of video',   in: 10)
        clip.process_params(name: 'end of video',   in: 15)
        expect(clip.valid?).to be true
      end
    end
  end

  # LEFT OFF HERE
  # NEED TO TEST PARAMTER PROCESSING
  # POSSIBLY ADD WARNING IF PROCESS_PARAMETERS CALLED AND NOTHING PROCESSED

  describe '#process_params' do
    context "when beginning frame count is missing" do
      it 'raises an exception' do
        expect { invalid_frame_count_in }.to raise_error(RuntimeError, 'frame_count_in: missing frame count')
      end
    end
    context "when ending frame count is missing" do
      it 'raises an exception' do
        expect { invalid_frame_count_out }.to raise_error(RuntimeError, 'frame_count_out: missing frame count')
      end
    end

    context 'when beginning frame count is present' do
      it 'does not raise an exception' do
        expect { valid_frame_count_in }.not_to raise_error
      end
    end

    context 'when ending frame count is present' do
      it 'does not raise an exception' do
        expect { valid_frame_count_out }.not_to raise_error
      end
    end
  end

  describe '#frame_count_in' do
    context 'before beginning frame count processed' do
      it 'returns nil' do
        expect(clip.frame_count_in).to be_nil
      end
    end
    context 'after beginning frame count processed' do
      it 'returns the correct value' do
        expect(valid_frame_count_in.frame_count_in).to eql(5)
      end
    end
  end

  describe '#frame_count_out' do
    context 'before ending frame count processed' do
      it 'returns nil' do
        expect(clip.frame_count_out).to be_nil
      end
    end
    context 'after ending frame count processed' do
      it 'returns the correct value' do
        expect(valid_frame_count_out.frame_count_out).to eql(10)
      end
    end
  end

  describe '#notes' do
    context "when notes are not processed" do
      it 'returns nil' do
        expect(clip.notes).to be_nil
      end
    end
    context "when notes are processed but empty" do
      it 'returns ""' do
        expect(valid_notes_no_note.notes).to eql("")
      end
    end
    context "when notes present and processed" do
      it 'returns the correct text' do
        expect(valid_notes_with_note.notes).to eql("digi notes")
      end
    end
  end

end
