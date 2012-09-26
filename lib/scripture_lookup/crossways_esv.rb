class CrosswaysEsv

  # Examples
  #  curl -G -d "key=IP&passage=John+1" http://www.esvapi.org/v2/rest/passageQuery
  #  curl -G -d "key=IP&passage=John+3.16&output-format=plain-text&include-passage-references=false&include-footnotes=false&include-passage-horizontal-lines=false&include-heading-horizontal-lines=false&include-headings=false&include-verse-numbers=false&include-short-copyright=false" http://www.esvapi.org/v2/rest/passageQuery 
  # TODO refactor book/chapter/verse into a class to encapsulate & decouple
  def lookup book, chapter, verse
  end
end
