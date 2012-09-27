class CrosswaysEsvProvider
  include HTTParty

  # Examples
  #  curl -G -d "key=IP&passage=John+1" http://www.esvapi.org/v2/rest/passageQuery
  #  curl -G -d "key=IP&passage=John+3.16&output-format=plain-text&include-passage-references=false&include-footnotes=false&include-passage-horizontal-lines=false&include-heading-horizontal-lines=false&include-headings=false&include-verse-numbers=false&include-short-copyright=false" http://www.esvapi.org/v2/rest/passageQuery 
  def lookup book, chapter, verse
    get('http://www.esvapi.org/v2/rest/passageQuery?key=IP&passage=#{book}+#{chapter}.#{verse}&output-format=plain-text&include-passage-references=false&include-footnotes=false&include-passage-horizontal-lines=false&include-heading-horizontal-lines=false&include-headings=false&include-verse-numbers=false&include-short-copyright=false')
  end
end
