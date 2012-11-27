require 'spec_helper'
require 'scripture_lookup/bible_gateway_provider'

describe ScriptureLookup::BibleGatewayProvider do
  before :each do
    @provider = ScriptureLookup::BibleGatewayProvider.new
  end

  describe "#new" do
    it "returns a BibleGatewayProvider instance" do
      @provider.should be_an_instance_of ScriptureLookup::BibleGatewayProvider
    end
  end

  #describe "#lookup" do
    #it "takes ScriptureReference & translation, & returns plain text scripture for John 3:16" do
      #@provider.lookup(make_ref("John 3:16"), :KJV).should eql "For God so"/
       #" loved the world, that he gave his only begotten Son, that whosoever"/
      #" believeth in him should not perish, but have everlasting life."
    #end
  #end
end
