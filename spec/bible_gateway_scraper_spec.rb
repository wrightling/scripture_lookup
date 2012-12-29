# encoding: UTF-8

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
      @provider.lookup(make_ref("Psalm 23"), :ESV).should match(/The Lord is my shepherd.*Even though I walk through the valley of the shadow of death,\n\s*I will fear no evil,.*and I shall dwell in the house of the Lord\n\s*forever\..*/m)
    end

    it "takes a ScriptureReference & returns scripture for John 3:16-17 from a German Bible" do
      @provider.lookup(make_ref("John 3:16-17"), :LUTH1545).should eql "Also hat "\
        "Gott die Welt geliebt, daß er seinen eingeborenen Sohn gab, auf daß "\
        "alle, die an ihn glauben, nicht verloren werden, sondern das ewige "\
        "Leben haben.\nDenn Gott hat seinen Sohn nicht gesandt in die Welt, "\
        "daß er die Welt richte, sondern daß die Welt durch ihn selig werde."
    end

    it "takes a ScriptureReference & returns scripture for Col 1:9-14 from the NLT" do
      @provider.lookup(make_ref("Col 1:9-14"), :NLT).should eql "So we have not "\
        "stopped praying for you since we first heard about you. We ask God to "\
        "give you complete knowledge of his will and to give you spiritual wisdom "\
        "and understanding.\nThen the way you live will always honor and please the "\
        "Lord, and your lives will produce every kind of good fruit. All the while, "\
        "you will grow as you learn to know God better and better.\nWe also pray "\
        "that you will be strengthened with all his glorious power so you will have "\
        "all the endurance and patience you need. May you be filled with joy,"\
        "\nalways thanking the Father. He has enabled you to share in the inheritance "\
        "that belongs to his people, who live in the light.\nFor he has rescued us "\
        "from the kingdom of darkness and transferred us into the Kingdom of his dear "\
        "Son,\nwho purchased our freedom and forgave our sins."
    end

    it "responds to an invalid version with an appropriate message" do
      @provider.lookup(make_ref("Rom 3:23"), :FAKE).should eql "Version FAKE is not valid."
    end
  end
end
