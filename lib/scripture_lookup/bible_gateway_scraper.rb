require 'metainspector'
require_relative 'response'
require_relative 'parsers/bible_gateway_scrape_parser'

module ScriptureLookup
  class BibleGatewayScraper
    attr_accessor :options

    def initialize(opts = {})
      @options = default_options.merge(opts)
    end

    def default_options
      {response_class: Response,
       parser: BibleGatewayScrapeParser}
    end

    def lookup reference, version
      url = "http://www.biblegateway.com/passage/?search=#{reference}&version=#{version.to_s}"
      doc = get_doc(url)

      generate_response doc
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

    def generate_response doc
      parser = options[:parser].new
      options[:response_class].new(parser.parse(doc))
    end
  end
end
