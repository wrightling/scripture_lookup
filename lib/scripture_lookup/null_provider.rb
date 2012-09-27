class NullProvider

  def lookup book, chapter, verse
    NullScripture.new
  end
end
