require 'tapp'

describe 'Object' do
  let(:object) { Object.new }

  describe '#tapp' do
    specify do
      object.should_receive(:pp).with(object)
      object.tapp
    end
  end

  describe '#taputs' do
    specify do
      object.should_receive(:puts).with(object)
      object.taputs
    end
  end
end
