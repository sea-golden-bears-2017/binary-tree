require 'rspec'
require_relative '../node'

describe Node do
  let(:node) { Node.new({data: 5}) }
  describe 'attributes' do
    it 'has data' do
      expect(node.data).to eq(5)
    end
    xit 'has a left child' do
      expect(node.left).to_not be_nil
    end
    it 'has a right child'
    it 'has a parent'
  end
  describe '#create_child' do
    it 'chooses left or right'
    it 'creates a child with the passed in data' do
      child = node.create_child(3)
      expect(child.data).to eq(3)
    end
    it 'sets the left attribute to the new child' do
      child = node.create_child(3)
      expect(node.left).to eq(child)
    end
    context 'raises an exception when' do
      it 'the right child exists and child data is greater than the parent data'
      it 'the left child exists and child data is less than the parent data'
      it 'there are already two children'
    end
  end
end
