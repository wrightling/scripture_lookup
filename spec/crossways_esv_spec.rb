require 'spec_helper'
require 'scripture_lookup/crossways_esv'

describe CrosswaysEsv do
  before :each do
    @crossways_esv = CrosswaysEsv.new
  end

  describe "without specifying a scripture provider" do
    describe "#new" do
      it "returns a Crossways ESV strategy with a NullProvider" do
        @crossways_esv.should be_an_instance_of CrosswaysEsv
        @crossways_esv.scripture_provider.should be_an_instance_of NullProvider
      end
    end
  end

  describe "with the crossways EVS scripture provider" do
    before :each do
      @crossways_esv.scripture_provider = CrosswaysEsvProvider.new
    end
    describe "#new" do
      it "returns a Crossways ESV strategy with a CrosswaysEsvProvider" do
        @crossways_esv.should be_an_instance_of CrosswaysEsv
        @crossways_esv.scripture_provider.should be_an_instance_of CrosswaysEsvProvider
      end
    end

    describe "#lookup" do
      it "takes book, chapter, verse & returns scripture for John 3:16" do
        @crossways_esv.lookup('John', 3, 16).should eql
          "For God so loved the world, that he gave his only Son, that whoever "\
          "believes in him should not perish but has eternal life."
      end
    end
  end
end
