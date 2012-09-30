require 'spec_helper'
require 'scripture_lookup/crossways_esv_provider'
require 'scripture_lookup/scripture_reference'

describe CrosswaysEsvProvider do
  before :each do
    @provider = CrosswaysEsvProvider.new

    @one_verse = ScriptureReference.new.reference = "John 3:16"
    @two_verses = ScriptureReference.new.reference = "2 Timothy 3:16-17"
    @six_verses = ScriptureReference.new.reference = "Col 1:9-14"
    @psalm_23 = ScriptureReference.new.reference = "Psalm 23"
  end

  describe "#new" do
    it "returns a CrosswaysEsvProvider instance" do
      @provider.should be_an_instance_of CrosswaysEsvProvider
    end
  end

  describe "#lookup" do
    it "takes a ScriptureReference & returns scripture for John 3:16" do
      @provider.lookup(@one_verse).should eql "\"For God so loved the world"\
        ", that he gave his only Son, that whoever "\
        "believes in him should not perish but have eternal life."
    end

    it "takes a ScriptureReference & returns scripture for Psalm 23" do
      @provider.lookup(@psalm_23).should match(/A Psalm of David.*Even though I walk through the valley of the shadow of death,\n\s*I will fear no evil,.*and I shall dwell in the house of the LORD\n\s*forever\..*/m)
    end
  end
end
