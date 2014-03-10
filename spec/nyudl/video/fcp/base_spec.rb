require 'spec_helper'

describe Nyudl::Video::Fcp::Base do
  let(:fcp) { Nyudl::Video::Fcp::Base.new('test/template.xml') }
  describe '.new' do
    it 'returns an object of the correct class' do
      expect(fcp).to be_instance_of(Nyudl::Video::Fcp::Base)
    end
    it 'raises an exception if file cannot be found' do
      expect {Nyudl::Video::Fcp::Base.new('asdfadfadsf')}.to raise_error(Errno::ENOENT)
    end
    it 'raises an exception if file is not readable'
  end
# # raises and
#   describe '#clips' do
# #    let (:fcp) {
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
end
