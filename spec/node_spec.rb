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
    context 'when the child data is less than the parent' do
      let!(:child) { node.create_child(3) }

      it 'returns a child with the passed in data' do
        expect(child.data).to eq(3)
      end
      it 'sets the left attribute to the new child' do
        expect(node.left).to eq(child)
      end
    end

    context 'when the child data is greater than the parent' do
      let!(:child) { node.create_child(7) }

      it 'returns a child with the passed in data' do
        expect(child.data).to eq(7)
      end
      it 'sets the left attribute to the new child' do
        expect(node.right).to eq(child)
      end
    end

    context 'raises an exception when' do
      it 'the right child exists and child data is greater than the parent data'
      it 'the left child exists and child data is less than the parent data'
      it 'there are already two children'
      it 'the data is the same value as the parent' do
        expect { node.create_child(5) }.to raise_error(Node::InvalidInsertionError)
      end
    end
  end
end
