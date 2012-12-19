require 'spec_helper'
require 'scripture_lookup/bible_gateway_scraper'

describe ScriptureLookup::BibleGatewayScraper do
  before :each do
    @provider = ScriptureLookup::BibleGatewayScraper.new
  end

  describe "#new" do
    it "returns a BibleGatewayScraper instance" do
      @provider.should be_an_instance_of ScriptureLookup::BibleGatewayScraper
    end
  end

  describe "#lookup" do
    it "takes ScriptureReference & translation & returns text for John 3:16" do
      @provider.lookup(make_ref("John 3:16"), :KJV).should eql "For God so"\
        " loved the world, that he gave his only begotten Son, that whosoever"\
        " believeth in him should not perish, but have everlasting life."
    end

    it "takes a ScriptureReference & returns scripture for Psalm 23" do
      @provider.lookup(make_ref("Psalm 23"), :ESV).should match(/The Lord is my shepherd.*Even though I walk through the valley of the shadow of death,\n\s*I will fear no evil,.*and I shall dwell in the house of the LORD\n\s*forever\..*/m)
    end

  end
end
