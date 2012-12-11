require 'metainspector'

module ScriptureLookup
  class BibleGatewayScraper
    def lookup reference, version
      url = "http://www.biblegateway.com/passage/?search=#{reference}&version=#{version.to_s}"
      page = MetaInspector.new(url)
      doc = page.parsed_document
      doc.css('div.passage p span.text').children.last.text
    end
  end
end
