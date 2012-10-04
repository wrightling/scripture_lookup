module ScriptureLookup
  class NullProvider

    def lookup reference
      NullScripture.new
    end
  end
end
