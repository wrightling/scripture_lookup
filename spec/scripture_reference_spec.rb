require 'spec_helper'
require 'scripture_lookup/scripture_reference'

describe ScriptureReference do
  before :each do
    @reference = ScriptureReference.new
  end

  describe "#new" do
    it "returns a ScriptureReference instance" do
      @reference.should be_an_instance_of ScriptureReference
    end
  end

  describe "with reference set to \"John 3:16\"" do
    before :each do
      @reference.reference = "John 3:16"
    end

    describe "#reference=" do
      it "should properly set the reference to John 3:16" do
        @reference.reference.should eql "John 3:16"
      end
    end

    describe "#to_s" do
      it "should properly return \"John 3:16\"" do
        @reference.to_s.should eql "John 3:16"
      end
    end

    describe "#to_str" do
      it "should properly return \"John 3:16\"" do
        @reference.to_str.should eql "John 3:16"
      end
    end
  end

  describe "#build_reference" do
    it "should properly set \"John 3:16-18\"" do
      @reference.build_reference( "John", 3, 16, 18).to_s.should eql "John 3:16-18"
    end
  end
end
