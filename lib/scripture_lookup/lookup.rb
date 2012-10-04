require 'scripture_lookup/crossways_esv_provider'

module ScriptureLookup
  class Lookup
    attr_accessor :provider

    def initialize
      @provider = CrosswaysEsvProvider.new
    end

    def lookup reference
      @provider.lookup(reference)
    end
  end
end
