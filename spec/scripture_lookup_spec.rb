require 'spec_helper'
require 'scripture_lookup/scripture_reference'
require 'scripture_lookup'

describe ScriptureLookup do
  before :each do
    @provider = ScriptureLookup.new
  end

  describe "#new" do
    # BibleGatewayScraper is the default provider among the various options.
    it "returns a BibleGatewayScraper instance" do
      @provider.should be_an_instance_of ScriptureLookup::BibleGatewayScraper
    end
  end
end
