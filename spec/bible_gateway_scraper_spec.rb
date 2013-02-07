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

  # Integration Tests
  #
  # Given a lack of contract around the HTML from BibleGateway.com, it is
  # important to avoid mocks and run against the production site.
  describe "#lookup" do
    context "with Response#to_s" do
      it "takes ScriptureReference & translation & returns text for John 3:16" do
        @provider.lookup("John 3:16", :KJV).to_s.should eql "For God so"\
          " loved the world, that he gave his only begotten Son, that whosoever"\
          " believeth in him should not perish, but have everlasting life."
      end

      it "takes a ScriptureReference & returns scripture for Psalm 23" do
        @provider.lookup("Psalm 23", :ESV).to_s.should match(/The Lord is my shepherd.*Even though I walk through the valley of the shadow of death, I will fear no evil,.*and I shall dwell in the house of the Lord forever\..*/m)
      end

      it "takes a ScriptureReference & returns scripture for John 3:16-17 from a German Bible" do
        @provider.lookup("John 3:16-17", :LUTH1545).to_s.should eql "Also hat "\
          "Gott die Welt geliebt, daß er seinen eingeborenen Sohn gab, auf daß "\
          "alle, die an ihn glauben, nicht verloren werden, sondern das ewige "\
          "Leben haben. Denn Gott hat seinen Sohn nicht gesandt in die Welt, "\
          "daß er die Welt richte, sondern daß die Welt durch ihn selig werde."
      end

      it "takes a ScriptureReference & returns scripture for Col 1:9-14 from the NLT" do
        @provider.lookup("Col 1:9-14", :NLT).to_s.should eql "So we have not "\
          "stopped praying for you since we first heard about you. We ask God to "\
        "give you complete knowledge of his will and to give you spiritual wisdom "\
        "and understanding. Then the way you live will always honor and please the "\
        "Lord, and your lives will produce every kind of good fruit. All the while, "\
        "you will grow as you learn to know God better and better. We also pray "\
        "that you will be strengthened with all his glorious power so you will have "\
        "all the endurance and patience you need. May you be filled with joy,"\
        " always thanking the Father. He has enabled you to share in the inheritance "\
        "that belongs to his people, who live in the light. For he has rescued us "\
        "from the kingdom of darkness and transferred us into the Kingdom of his dear "\
        "Son, who purchased our freedom and forgave our sins."
      end
   end

    context "with Response#response_data" do
      it "takes ScriptureReference & translation & returns text for John 3:16" do
        @provider.lookup("John 3:16", :KJV).response_data.should include(
          translation: 'King James Version (KJV)'
        )
      end

      it "takes a ScriptureReference & returns scripture for Psalm 23" do
        @provider.lookup("Psalm 23", :ESV).response_data.should include(
          translation: 'English Standard Version (ESV)'
        )
      end
   end
  end
end
