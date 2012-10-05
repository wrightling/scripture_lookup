require 'rspec'
require 'scripture_lookup/scripture_reference'

def make_ref reference
  ScriptureLookup::ScriptureReference.new.reference = reference
end

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
end
