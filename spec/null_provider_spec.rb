require 'spec_helper'
require 'scripture_lookup/null_provider'
require 'scripture_lookup/null_scripture'

# Implementation of the Null Object Pattern to control what happens
# if no provider is selected for a given scripture lookup strategy.
describe ScriptureLookup::NullProvider do
  before :each do
    @null_provider = ScriptureLookup::NullProvider.new
  end

  describe "#new" do
    it "returns a NullProvider stand-in" do
      @null_provider.should be_an_instance_of ScriptureLookup::NullProvider
    end
  end

  describe "#lookup" do
    it "takes a ScriptureReference & returns a NullScripture object" do
      @null_provider.lookup(make_ref "Rom 3:23").should be_an_instance_of ScriptureLookup::NullScripture
    end
  end
end
