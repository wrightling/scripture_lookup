require 'spec_helper'
require 'scripture_lookup/null_provider'
require 'scripture_lookup/null_scripture'

# Implementation of the Null Object Pattern to control what happens
# if no provider is selected for a given scripture lookup strategy.
describe NullProvider do
  before :each do
    @null_provider = NullProvider.new
  end

  describe "#new" do
    it "returns a NullProvider stand-in" do
      @null_provider.should be_an_instance_of NullProvider
    end
  end

  describe "#lookup" do
    it "takes book, chapter, verse & returns a NullScripture object" do
      @null_provider.lookup('John', 3, 16).should be_an_instance_of NullScripture
    end
  end
end
