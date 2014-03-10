require 'spec_helper'

describe Nyudl::Video::Techlog::Clip do
  let(:clip) { Nyudl::Video::Techlog::Clip.new({}) }
  let(:invalid_frame_count_in) { Nyudl::Video::Techlog::Clip.new(name: 'start of video') }
  let(:invalid_frame_count_out){ Nyudl::Video::Techlog::Clip.new(name: 'end of video') }
  let(:valid_frame_count_in) { Nyudl::Video::Techlog::Clip.new(name: 'start of video', in: 5) }
  let(:valid_frame_count_out){ Nyudl::Video::Techlog::Clip.new(name: 'end of video',   in: 10) }

  describe '.new' do
    it 'returns an object of the correct class' do
      expect(clip).to be_instance_of(Nyudl::Video::Techlog::Clip)
    end
  end
  describe '#valid?' do
    it 'should be invalid if no parameters are provided' do
      expect(clip.valid?).to be false
    end
  end
  describe '#process_params' do
    it 'raises an exception if beginning frame count missing' do
      expect { invalid_frame_count_in }.to raise_error(RuntimeError, 'frame_count_in: missing frame count')
    end
    it 'raises an exception if end frame count missing' do
      expect { invalid_frame_count_out }.to raise_error(RuntimeError, 'frame_count_out: missing frame count')
    end

    it 'does not raise an exception if beginning frame count present' do
      expect { valid_frame_count_in }.not_to raise_error
    end
    it 'raises an exception if end frame count missing' do
      expect { valid_frame_count_out }.not_to raise_error
    end
  end
  describe '#frame_count_in' do
    it 'returns nil if frame_count_in not initialized' do
      expect(clip.frame_count_in).to be_nil
    end
    it 'returns correct value if frame_count_in is initialized' do
      expect(valid_frame_count_in.frame_count_in).to eql(5)
    end
  end
  describe '#frame_count_out' do
    it 'returns nil if frame_count_out not initialized' do
      expect(clip.frame_count_out).to be_nil
    end
    it 'returns correct value if frame_count_in is initialized' do
      expect(valid_frame_count_out.frame_count_out).to eql(10)
    end
  end
end
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

