require 'scripture_lookup/crossways_esv_provider'

module ScriptureLookup
  ##
  # Class may be unnecessary unless we decide to move forward with a strategy
  # pattern and require selection from among multiple providers, if encapsulating
  # the calls to the providers in a Lookup class (composition) becomes useful.
  #
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
