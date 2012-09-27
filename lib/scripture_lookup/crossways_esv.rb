class CrosswaysEsv

  def initialize
    @scripture_provider = NullProvider.new
  end

  attr_accessor :scripture_provider

  # TODO refactor book/chapter/verse into a class to encapsulate & decouple
  def lookup book, chapter, verse
    @scripture_provider.lookup book, chapter, verse
  end
end
