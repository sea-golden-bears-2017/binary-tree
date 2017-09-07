require 'rspec'
require_relative '../node'

describe Node do
  let(:node) { Node.new({data: 5}) }
  describe 'attributes' do
    it 'has data' do
      expect(node.data).to eq(5)
    end

    it 'has a left child' do
      expect(node.left).to be_nil
    end

    it 'has a right child' do
      expect(node.left).to be_nil
    end

    it 'has a parent' do
      expect(node.parent).to be_nil
    end

    it 'cannot change the parent outside the class' do
      expect { node.parent = 5 }.to raise_error(NoMethodError)
    end
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

      it 'sets the parent of the child' do
        expect(child.parent).to eq(node)
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

      it 'sets the parent of the child' do
        expect(child.parent).to eq(node)
      end
    end

    context 'raises an exception when' do
      it 'the right child exists and child data is greater than the parent data' do
        node.create_child(7)
        expect { node.create_child(6) }.to raise_error(Node::InvalidInsertionError)
      end

      it 'the left child exists and child data is less than the parent data' do
        node.create_child(3)
        expect { node.create_child(4) }.to raise_error(Node::InvalidInsertionError)

      end

      it 'there are already two children' do
        node.create_child(3)
        node.create_child(7)
        expect { node.create_child(3) }.to raise_error(Node::InvalidInsertionError)
      end
      it 'the data is the same value as the parent' do
        expect { node.create_child(5) }.to raise_error(Node::InvalidInsertionError)
      end
    end
  end
end
