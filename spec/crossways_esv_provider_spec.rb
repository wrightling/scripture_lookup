require 'spec_helper'
require 'scripture_lookup/crossways_esv_provider'

describe ScriptureLookup::CrosswaysEsvProvider do
  before :each do
    @provider = ScriptureLookup::CrosswaysEsvProvider.new
  end

  describe "#new" do
    it "returns a CrosswaysEsvProvider instance" do
      @provider.should be_an_instance_of ScriptureLookup::CrosswaysEsvProvider
    end
  end

  describe "#lookup" do
    it "takes a ScriptureReference & returns scripture for John 3:16" do
      @provider.lookup(make_ref "John 3:16").should eql "\"For God so loved the world"\
        ", that he gave his only Son, that whoever "\
        "believes in him should not perish but have eternal life."
    end

    it "takes a ScriptureReference & returns scripture for Psalm 23" do
      @provider.lookup(make_ref "Psalm 23").should match(/A Psalm of David.*Even though I walk through the valley of the shadow of death,\n\s*I will fear no evil,.*and I shall dwell in the house of the LORD\n\s*forever\..*/m)
    end
  end
end
