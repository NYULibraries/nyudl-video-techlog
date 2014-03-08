require 'spec_helper'

describe Nyudl::Video::Fcp::Base do
  context '.new' do
    it 'returns an object of the correct class' do
      expect(Nyudl::Video::Fcp::Base.new()).to be_instance_of(Nyudl::Video::Fcp::Base)
    end
  end
end
