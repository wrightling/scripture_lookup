require 'spec_helper'
require 'scripture_lookup/crossways_esv_provider'

describe CrosswaysEsvProvider do
  before :each do
    @provider = CrosswaysEsvProvider.new
  end

  describe "#new" do
    it "returns a CrosswaysEsvProvider instance" do
      @provider.should be_an_instance_of CrosswaysEsvProvider
    end
  end

  describe "#lookup" do
    it "takes book, chapter, verse & returns scripture for John 3:16" do
      @provider.lookup('John', 3, 16).should eql "For God so loved the world"\
        ", that he gave his only Son, that whoever "\
        "believes in him should not perish but has eternal life."
    end
  end
end
