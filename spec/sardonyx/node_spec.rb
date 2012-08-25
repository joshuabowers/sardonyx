require 'spec_helper'

describe Sardonyx::Node do
  it { should respond_to(:left, :right).with(0).arguments }
  it { should respond_to(:parent, :grandparent, :uncle).with(0).arguments }
  it { should respond_to(:value) }
  it { should respond_to(:color) }
end