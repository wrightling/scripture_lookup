# encoding: UTF-8

require 'spec_helper'
require 'scripture_lookup/parsers/bible_gateway_scrape_parser'

describe ScriptureLookup::BibleGatewayScrapeParser do
  before :all do
    @thess_5 = {translation: "English Standard Version (ESV)",
                content: {"1Thess-5-16" => {verse: ["Rejoice always,"]},
                          "1Thess-5-17" => {verse: ["pray without ceasing,"]},
                          "1Thess-5-18" => {verse: ["give thanks in all circumstances; for"\
                                                    " this is the will of God in Christ"\
                                                    " Jesus for you."]}}}
    @col_1_9_14 = 
      {translation: "New American Standard Bible (NASB)",
       content: {"Col-1-9" => {verse:  ["For this reason also, since the day we heard of it"\
                                        ", we have not ceased to pray for you and to ask that"\
                                        " you may be filled with the knowledge of His will"\
                                        " in all spiritual wisdom and understanding,"]},
                 "Col-1-10" => {verse: ["so that you will walk in a manner worthy of the Lord,"\
                                        " to please Him in all respects, bearing fruit in every"\
                                        " good work and increasing in the knowledge of God;"]},
                 "Col-1-11" => {verse: ["strengthened with all power, according to His"\
                                        " glorious might, for the attaining of all steadfastness"\
                                        " and patience; joyously"]},
                 "Col-1-12" => {verse: ["giving thanks to the Father, who has qualified us to"\
                                        " share in the inheritance of the saints in Light."]},
                 "Col-1-13" => {title: "The Incomparable Christ",
                                verse: ["For He rescued us from the domain of darkness, and"\
                                        " transferred us to the kingdom of His beloved Son,"]},
                 "Col-1-14" => {verse: ["in whom we have redemption, the forgiveness of sins."]}}}
    @psalm_23_1 =
      {translation: "New American Standard Bible (NASB)",
       content: {"Ps-23-1" => {title: "The Lord, the Psalmist’s Shepherd.",
                               subtitle: "A Psalm of David.",
                               verse: ["The Lord is my shepherd,",
                                       "I shall not want."]}}}
  end

  describe "#parse" do
    before :each do
      @parser = ScriptureLookup::BibleGatewayScrapeParser.new
    end

    context "with 1 Thess 5:16-18" do
      before :each do
        @doc = fixture_file("bg_1_thess_5_16_18.html")
      end

      it "should accept a html doc and return the appropriate data structure" do
        @parser.parse(@doc).should eql @thess_5
      end
    end

    context "with Colossians 1:9-14" do
      before :each do
        @doc = fixture_file("bg_col_1_9_14.html")
      end

      it "should accept an html doc and return the appropriate data structure" do
        @parser.parse(@doc).should eql @col_1_9_14
      end
    end

    context "with Psalm 23:1" do
      before :each do
        @doc = fixture_file("bg_psalm_23_1.html")
      end

      it "should accept an html doc and return the appropriate data structure" do
        @parser.parse(@doc).should eql @psalm_23_1
      end
    end
  end
end
