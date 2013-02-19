$:.push File.expand_path("../lib", __FILE__)
require 'scripture_lookup/version'

Gem::Specification.new do |s|
  s.name          = 'scripture_lookup'
  s.version       = ScriptureLookup::VERSION
  s.date          = '2012-10-01'
  s.summary       = "Pull back verses from popular Bible sites easily."
  s.description   = "A gem to assist in pulling back and querying scripture."
  s.authors       = ["Warren Wright"]
  s.email         = 'warren@thewrightangle.com'
  s.files         = ["lib/scripture_lookup.rb", "lib/scripture_lookup/bible_gateway_scraper.rb", "lib/scripture_lookup/response.rb", "lib/scripture_lookup/parsers/bible_gateway_scrape_parser.rb", "lib/scripture_lookup/crossways_esv_provider.rb"]
  s.require_paths = ["lib"]
  s.homepage      = 'http://thewrightangle.com'
  s.executables   << 'scripture'

  s.add_development_dependency 'rspec'
  s.add_runtime_dependency 'metainspector'
  s.add_runtime_dependency 'loofah'
  s.add_runtime_dependency 'httparty'
end
