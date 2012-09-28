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

  describe "with scripture initialization using setters" do
    before :each do
      @reference.book = 'John'
      @reference.chapter = 3
      @reference.from_verse = 16
    end

    describe "with initialization to John 3:16 using setters" do
      it "should have book=John, chapter=3, from_verse=16, to_verse=nil" do
        @reference.book.should eql "John"
        @reference.chapter.should eql 3
        @reference.from_verse.should eql 16
        @reference.to_verse.should be_nil
      end

      describe "#to_s" do
        it "should return \"John 3:16\"" do
          @reference.to_s.should eql "John 3:16"
        end
      end

      describe "#to_str" do
        it "should return \"John 3:16\"" do
          @reference.to_str.should eql "John 3:16"
        end
      end
    end
  end
end
