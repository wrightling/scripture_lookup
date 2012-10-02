require 'scripture_lookup/crossways_esv_provider'

class ScriptureLookup
  attr_accessor :provider

  def initialize
    @provider = CrosswaysEsvProvider.new
  end

  def lookup reference
    @provider.lookup(reference)
  end
end
