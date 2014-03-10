require 'spec_helper'

describe Nyudl::Video::Techlog::Clip do
  let(:clip) { Nyudl::Video::Techlog::Clip.new({}) }

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
      expect { Nyudl::Video::Techlog::Clip.new(name: 'beginning of video') }.to raise_error(RuntimeError, 'frame_count_in: missing frame count')
    end
    it 'raises an exception if end frame count missing' do
      expect { Nyudl::Video::Techlog::Clip.new(name: 'end of video') }.to raise_error(RuntimeError, 'frame_count_out: missing frame count')
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
