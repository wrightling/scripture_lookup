require 'metainspector'
require 'loofah'

module ScriptureLookup
  class BibleGatewayScraper
    def lookup reference, version
      url = "http://www.biblegateway.com/passage/?search=#{reference}&version=#{version.to_s}"
      page = MetaInspector.new(url)
      doc = Loofah.fragment(page.document)

      kill_sup = Loofah::Scrubber.new { |node| node.remove if node.name == "sup" or node["class"] == "chapternum" }
      doc.scrub!(kill_sup)

      nodes = doc.xpath('.//div[contains(@class, "passage")]//p//span[contains(@class,"text")]')
      nodes.to_a.join("\n")
    end
  end
end
