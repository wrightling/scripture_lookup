module ScriptureLookup
  extend self

  autoload :Error, 'scripture_lookup/errors/error'
  autoload :Lookup, 'scripture_lookup/lookup'
  autoload :CrosswaysEsvProvider, 'scripture_lookup/crossways_esv_provider'
  autoload :BibleGatewayScraper, 'scripture_lookup/bible_gateway_scraper'

  # Sugar method to be able to quickly create a provider.
  #
  # BibleGatewayScraper is the default provider as it can return scripture
  # from the most translations.
  def new
    BibleGatewayScraper.new
  end
end
