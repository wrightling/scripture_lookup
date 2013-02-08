module ScriptureLookup
  class Error < StandardError
    attr_reader :original

    def initialize(message, original=nil)
      super message
      @original = original
    end
  end
end
