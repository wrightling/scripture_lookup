# encoding: UTF-8

require 'spec_helper'
require 'scripture_lookup/response'

describe ScriptureLookup::Response do
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

  describe "#new" do
    it "has a response_data attribute that matches the original input to the initializer" do
      ScriptureLookup::Response.new(@thess_5).response_data.should eql @thess_5
    end
  end

  context "1 Thess 5:16-18, ESV" do
    before :each do
      @response = ScriptureLookup::Response.new(@thess_5)
    end

    describe "#verses" do
      it "should return an array containing all verses - the text only" do
        @response.verses.should include "pray without ceasing,"
      end
    end

    describe "#to_s" do
      it "returns a string containing all scripture, paragraphs separated by newlines" do
        @response.to_s.should eql "Rejoice always, pray without ceasing, give "\
          "thanks in all circumstances; for this is the will of God in Christ "\
          "Jesus for you."
      end
    end
  end

  context "Col 1:9-14" do
    before :each do
      @response = ScriptureLookup::Response.new(@col_1_9_14)
    end

    describe "#verses" do
      it "should return an array containing all verses in Col 1:9-14" do
        @response.verses.should include "For He rescued us from the domain of darkness, and"\
                                        " transferred us to the kingdom of His beloved Son,"
      end
    end

    describe "#to_s" do
      it "should return a string containing Col 1:9-14, paragraphs separated by newlines" do
        @response.to_s.should eql "For this reason also, since the day we heard of it"\
                                  ", we have not ceased to pray for you and to ask that"\
                                  " you may be filled with the knowledge of His will"\
                                  " in all spiritual wisdom and understanding,"\
                                  " so that you will walk in a manner worthy of the Lord,"\
                                  " to please Him in all respects, bearing fruit in every"\
                                  " good work and increasing in the knowledge of God;"\
                                  " strengthened with all power, according to His"\
                                  " glorious might, for the attaining of all steadfastness"\
                                  " and patience; joyously"\
                                  " giving thanks to the Father, who has qualified us to"\
                                  " share in the inheritance of the saints in Light."\
                                  " For He rescued us from the domain of darkness, and"\
                                  " transferred us to the kingdom of His beloved Son,"\
                                  " in whom we have redemption, the forgiveness of sins."
      end
    end
  end

  context "with invalid response_data" do
    before :each do
      @bad_response = ScriptureLookup::Response.new({})
    end

    describe "#verses" do
      it "should return NoMethodError wrapped in ScriptureLookup::Error" do
        expect { @bad_response.verses }.to raise_error ScriptureLookup::Error
      end
    end

    describe "#to_s" do
      it "should return NoMethodError wrapped in ScriptureLookup::Error" do
        expect { @bad_response.to_s }.to raise_error ScriptureLookup::Error
      end
    end
  end
end
