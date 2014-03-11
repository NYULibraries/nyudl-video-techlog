require 'spec_helper'

describe Nyudl::Video::Techlog::Fcp do
  let(:techlog) { Nyudl::Video::Techlog::Fcp.new('test/template.xml') }
  let(:techlog_single) { Nyudl::Video::Techlog::Fcp.new('test/template.xml') }
  describe '.new' do
    it 'returns an object of the correct class' do
      expect(techlog).to be_instance_of(Nyudl::Video::Techlog::Fcp)
    end
    it 'raises an exception if file cannot be found' do
      expect {Nyudl::Video::Techlog::Fcp.new('asdfadfadsf')}.to raise_error(Errno::ENOENT)
    end
    it 'raises an exception if file is not readable'
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