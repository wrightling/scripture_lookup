# encoding: UTF-8

require 'spec_helper'
require 'scripture_lookup/response'

describe ScriptureLookup::Response do
  before :all do
    @thess_5 = {title: "Some Title", reference: "1 Thessalonians 5:16-18",
                  translation: "English Standard Version (ESV)",
                  verses: {16 => "Rejoice always,", 17 => "pray without ceasing,",
                           18 => "give thanks in all circumstances, for this is the will"\
                           " of God in Christ Jesus for you."}}
  end

  describe "#new" do
    it "has a data attribute that matches the original input to the initializer" do
      ScriptureLookup::Response.new(@thess_5).data.should eql @thess_5
    end
  end

  context "1 Thess 5:16-18, ESV" do
    before :each do
      @response = ScriptureLookup::Response.new(@thess_5)
    end

    describe "#to_s" do
      it "returns a string containing all scripture, verses separated by newlines" do
        @response.to_s.should eql "Rejoice always,\npray without ceasing,\ngive "\
          "thanks in all circumstances, for this is the will of God in Christ "\
          "Jesus for you."
      end
    end

    describe "#to_json" do
      it "returns a JSON encoding of @data" do
        @response.to_json.should eql \
          "{\"title\":\"Some Title\",\"reference\":\"1 Thessalonians 5:16-18\",\""\
          "translation\":\"English Standard Version (ESV)\",\"verses\":{\"16\":\""\
          "Rejoice always,\",\"17\":\"pray without ceasing,\",\"18\":\"give thanks"\
          " in all circumstances, for this is the will of God in Christ Jesus for you.\"}}"
      end
    end
  end
end
