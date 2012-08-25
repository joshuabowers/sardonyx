require 'spec_helper'

describe Sardonyx::Tree do
  it { should respond_to(:insert).with(1).argument }
  it { should respond_to(:remove).with(1).argument }
  it { should respond_to(:each) }
  it { should respond_to(:rotate_left).with(0).arguments }
  it { should respond_to(:rotate_right).with(0).arguments }
end