module ScriptureLookup
  # Extracted this class from commonly passed triplet of parameters
  #   book, chapter, verse
  class ScriptureReference
    attr_accessor :reference

    def to_s
      @reference.to_s
    end

    def to_str
      to_s
    end

    def build_reference book, chapter, from_verse, to_verse
      @reference = book << " " << chapter.to_s
      @reference << ":" << from_verse.to_s unless from_verse.nil?
      @reference << "-" << to_verse.to_s unless from_verse.nil? or to_verse.nil?
    end
  end
end
