require 'spec_helper'

describe Sardonyx::Node do
  it { should respond_to(:left, :right).with(0).arguments }
  it { should respond_to(:parent, :grandparent, :uncle).with(0).arguments }
  it { should respond_to(:value) }
  it { should respond_to(:color) }
end

describe "A new node" do
  subject { Sardonyx::Node.new }
  its(:parent) { should be_nil }
  its(:grandparent) { should be_nil }
  its(:uncle) { should be_nil }
  its(:left) { should be_nil }
  its(:right) { should be_nil }
  its(:color) { should == :black }
  its(:value) { should be_nil }
end

describe "A node with children" do
  subject { Sardonyx::Node.new(left: Sardonyx::Node.new, right: Sardonyx::Node.new) }
  its("left.parent") { should == subject }
  its("right.parent") { should == subject }
end

describe "A left nested node" do
  let(:root) { Sardonyx::Node.new(left: Sardonyx::Node.new(left: Sardonyx::Node.new), right: Sardonyx::Node.new) }
  subject { root.left.left }
  its(:grandparent) { should_not be_nil }
  its(:grandparent) { should == root }
  its(:uncle) { should == root.right }
end

describe "A right nested node" do
  let(:root) { Sardonyx::Node.new(left: Sardonyx::Node.new, right: Sardonyx::Node.new(left: Sardonyx::Node.new)) }
  subject { root.right.left }
  its(:grandparent) { should_not be_nil }
  its(:grandparent) { should == root }
  its(:uncle) { should == root.left }
end

describe "Given a root node" do
  let(:root_q) { Sardonyx::Node.new(value: "Q", left: Sardonyx::Node.new(value: "P", left: Sardonyx::Node.new(value: "A"), right: Sardonyx::Node.new(value: "B")), right: Sardonyx::Node.new(value: "C")) }
  let(:root_p) { Sardonyx::Node.new(value: "P", left: Sardonyx::Node.new(value: "A"), right: Sardonyx::Node.new(value: "Q", left: Sardonyx::Node.new(value: "B"), right: Sardonyx::Node.new(value: "C"))) }
  describe "A right rotation" do
    subject { root_q }
    its(:rotate_right) { should == root_p }
  end
  describe "A left rotation" do
    subject { root_p }
    its(:rotate_left) { should == root_q }
  end
end