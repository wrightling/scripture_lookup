module ScriptureLookup
  class Error < StandardError
    attr_reader :original

    def initialize(message=nil, original=$!)
      super message || original && original.message
      @original = original
    end
  end
end
