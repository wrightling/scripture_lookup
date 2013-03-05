module ScriptureLookup
  extend self

  require_relative 'scripture_lookup/errors/error'
  require_relative 'scripture_lookup/bible_gateway_scraper'

  def default_provider
    @default_provider ||= BibleGatewayScraper
  end

  def default_provider=(value)
    @default_provider = value
  end

  # Sugar method to be able to quickly create a provider.
  #
  # BibleGatewayScraper is the default provider as it can return scripture
  # from the most translations.
  def new
    self.default_provider.new
  end
end
