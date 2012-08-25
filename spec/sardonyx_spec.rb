require 'spec_helper'

describe Sardonyx do
  it "should have a VERSION constant" do
    subject.const_get('VERSION').should_not be_empty
  end
  
  it "should have a COLORS constant" do
    subject.const_get("COLORS").should_not be_empty
    subject.const_get("COLORS").should == [:red, :black]
  end
    
  it "should have a Tree class" do
    subject.const_get('Tree').should_not be_nil
    subject.const_get('Tree').should be_kind_of(Class)
  end
  
  it "should have a Node class" do
    subject.const_get('Node').should_not be_nil
    subject.const_get('Node').should be_kind_of(Class)
  end
end
