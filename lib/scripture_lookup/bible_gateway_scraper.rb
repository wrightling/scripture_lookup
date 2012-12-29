require 'metainspector'
require 'loofah'

module ScriptureLookup
  class BibleGatewayScraper
    def lookup reference, version
      url = "http://www.biblegateway.com/passage/?search=#{reference}&version=#{version.to_s}"
      frag = Loofah.fragment(get_doc(url))

      kill_sup = Loofah::Scrubber.new { |node| node.remove if node.name == "sup" or node["class"] == "chapternum" }
      frag.scrub!(kill_sup)

      nodes = frag.xpath('.//div[contains(@class, "passage")]//p//span[contains(@class,"text")]')
      nodes.to_a.join("\n")

      rescue Exception => e
        e.message
    end

    private

    ##
    # BibleGatewayScraper#get_doc deals with the fetching of HTML content from Bible Gateway.
    def get_doc(url)
      page = MetaInspector.new(url)
      doc = page.document

      raise page.errors[0] if !page.ok?

      doc
    end
  end
end
