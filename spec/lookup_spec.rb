require 'spec_helper'
require 'scripture_lookup/lookup'

# This class may be obsolete as I move towards a modle-centric design.
describe Lookup do
  before :each do
    @lookup = Lookup.new

    @rom3_23 = "Rom 3:23"
  end

  describe "#new" do
    it "returns a Lookup object" do
      @lookup.should be_an_instance_of Lookup
    end
  end

  describe "#lookup" do
    it "takes book, chapter, verse & returns scripture" do
      @lookup.lookup(@rom3_23).should eql "for all have sinned and fall short of the glory of God,"
    end
  end
end
