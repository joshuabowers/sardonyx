require 'spec_helper'

describe Sardonyx::Tree do
  it { should respond_to(:insert).with(1).argument }
  it { should respond_to(:remove).with(1).argument }
  it { should respond_to(:each) }
end