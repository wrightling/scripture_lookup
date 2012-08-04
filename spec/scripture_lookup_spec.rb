require 'scripture_lookup'

describe Scripture_lookup do
  before :each do
    @scripture_lookup = Scripture_lookup.new
  end

  describe "#new" do
    it "returns a Scripture_lookup object" do
      @scripture_lookup.should be_an_instance_of Scripture_lookup
    end
  end
end
