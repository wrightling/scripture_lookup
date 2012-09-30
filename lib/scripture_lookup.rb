class ScriptureLookup
  attr_accessor :providers

  def initialize
    @providers = [CrosswaysEsvProvider.new]
  end

  def lookup reference
    @providers[0].lookup(reference)
  end
end
