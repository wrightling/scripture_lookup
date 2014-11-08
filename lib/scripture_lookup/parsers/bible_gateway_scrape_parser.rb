require 'loofah'

module ScriptureLookup
  # Encapsulate the messy parsing of raw BibleGateway.com HTML into
  # a structure of hashes and arrays expected by Response.
  class BibleGatewayScrapeParser
    CLASSES_TO_IGNORE = ["chapternum", "icon-fallback-text", "footnote-text"]

    def parse(doc)
      # scrub out footnotes and cross references.
      frag = Loofah.fragment(doc)
      kill_sup = Loofah::Scrubber.new { |node| node.remove if (node.name == "sup") or CLASSES_TO_IGNORE.include?(node["class"]) }
      frag.scrub!(kill_sup)

      {translation: translation(frag),
       content: content(frag)}
    end

    private

    def translation(doc)
      path = './/span[contains(@class, "passage-display-version")]'
      doc.xpath(path).text
    end

    def content(doc)
      path = './/div[contains(@class, "passage")]//span[contains(@class, "text")]'
      passages = doc.xpath(path)

      passages.each_with_object({}) do |passage, hsh|
        reference = passage["class"].split.last   #ex.  "Col-1-9"
        hsh[reference] = {} unless hsh.has_key? reference
        add_passage_text(hsh[reference], passage)
      end
    end

    def add_passage_text(hsh, passage)
      if passage.parent.name == "h3"
        hsh[:title] = passage.text
      elsif passage.parent.name == "h4"
        hsh[:subtitle] = passage.text
      else
        hsh[:verse] = [] unless hsh.has_key? :verse
        hsh[:verse] << passage.text
      end
    end
  end
end
