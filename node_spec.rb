require './node.rb'
require 'rspec'


describe Node, "#get_value" do
  context "With given an array of 1" do
    it "Takes the value of the only element" do
      node = Node.new(1)
      expect(node.value).to eq(1)
    end
  end
  context "when given another node" do
    it "takes the node as a child" do
      stored_node = Node.new(5)
      node = Node.new(3, stored_node)
      expect(node.get_parent.class).to eq(Node)
    end
  end
end

describe "#build_tree" do
  it "creates a binary tree of 1 node with given 1 element array" do
    tree = build_tree([1])
    expect(tree.value).to eq(1)
  end
  it "creates binary trees from arrays" do
    tree = build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
    puts tree
  end
end
