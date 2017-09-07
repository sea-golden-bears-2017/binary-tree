require 'rspec'
require_relative '../node'

describe Node do
  let(:node) { Node.new(5) }
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

  describe '#detach' do
    let!(:left_child) { node.create_child(3) }
    let!(:right_child) { node.create_child(7) }

    it 'keeps the parent as nil if already detached' do
      node.detach
      expect(node.parent).to be_nil
    end

    context 'left child' do
      before(:each) { left_child.detach }

      it 'sets the parent to nil' do
        expect(left_child.parent).to be_nil
      end

      it 'sets the parent to nil when detaching' do
        expect(left_child.parent).to be_nil
      end

      it 'sets the left attribute of the parent to be nil' do
        expect(node.left).to be_nil
      end

      it 'leaves the right child alone' do
        expect(node.right).to be(right_child)
      end
    end

    context 'right child' do
      before(:each) { right_child.detach }

      it 'sets the parent to nil' do
        expect(right_child.parent).to be_nil
      end

      it 'sets the parent to nil when detaching' do
        expect(right_child.parent).to be_nil
      end

      it 'sets the right attribute of the parent to be nil' do
        expect(node.right).to be_nil
      end

      it 'leaves the left child alone' do
        expect(node.left).to be(left_child)
      end
    end
  end

  describe '#is_root?' do
    it 'returns true if it has no parent' do
      expect(node.is_root?).to be true
    end

    it 'returns false if it has a parent' do
      child = node.create_child(3)
      expect(child.is_root?).to be false
    end
  end

  describe '#is_leaf?' do
    it 'returns true if it has no children' do
      expect(node.is_leaf?).to be true
    end

    it 'returns false if it has a left child' do
      node.create_child(3)
      expect(node.is_leaf?).to be false
    end

    it 'returns false if it has a right child' do
      node.create_child(7)
      expect(node.is_leaf?).to be false
    end

    it 'returns false if it has two children' do
      node.create_child(3)
      node.create_child(7)
      expect(node.is_leaf?).to be false
    end
  end
end
