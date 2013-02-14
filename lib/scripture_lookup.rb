module ScriptureLookup
  extend self

  require_relative 'scripture_lookup/errors/error'
  require_relative 'scripture_lookup/crossways_esv_provider'
  require_relative 'scripture_lookup/bible_gateway_scraper'

  # Sugar method to be able to quickly create a provider.
  #
  # BibleGatewayScraper is the default provider as it can return scripture
  # from the most translations.
  def new
    BibleGatewayScraper.new
  end
end
