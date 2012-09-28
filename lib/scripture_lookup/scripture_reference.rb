# Extracted this class from commonly passed triplet of parameters
#   book, chapter, verse
class ScriptureReference
  attr_accessor :book
  attr_accessor :chapter
  attr_accessor :from_verse
  attr_accessor :to_verse

  def to_s
    ref = @book << " " << chapter.to_s
    ref << ":" << from_verse.to_s unless from_verse.nil?
    ref << "-" << to_verse.to_s unless to_verse.nil? or from_verse.nil?
    ref
  end

  def to_str
    to_s
  end
end
