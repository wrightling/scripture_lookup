require 'rspec'
require 'scripture_lookup/response'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
end

def fixture_file(filename)
  return '' if filename == ''
  file_path = File.expand_path(File.dirname(__FILE__) + '/fixtures/' + filename)
  File.read(file_path)
end
