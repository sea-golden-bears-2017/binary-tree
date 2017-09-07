require 'rspec'
require_relative '../binary_tree'
require_relative '../node'

describe BinaryTree do
  let(:node) { Node.new({data: 5}) }
  let(:tree) { BinaryTree.new(node) }

  it 'has a root' do
    expect(tree.root).to eq(node)
  end

  it 'has a root without a parent' do
    expect(tree.root.parent).to be_nil
  end
end
