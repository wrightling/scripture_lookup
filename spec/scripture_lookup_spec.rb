require 'spec_helper'
require 'scripture_lookup'

describe ScriptureLookup do
  before :each do
    @scripture_lookup = ScriptureLookup.new
  end

  describe "#new" do
    it "returns a ScriptureLookup object" do
      @scripture_lookup.should be_an_instance_of ScriptureLookup
    end
  end

  describe "#lookup" do
    it "takes book, chapter, verse & returns scripture" do
      @scripture_lookup.lookup('Romans',3,23).should eql "For all have sinned and fall short of the glory of God."
    end
  end
end
