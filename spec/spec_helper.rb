require 'rspec'
require 'pry'
require 'scripture_lookup/response'
require 'scripture_lookup/errors/error'

RSpec.configure do |config|
  config.color = true
  config.formatter     = 'documentation'
end

def fixture_file(filename)
  return '' if filename == ''
  file_path = File.expand_path(File.dirname(__FILE__) + '/fixtures/' + filename)
  File.read(file_path)
end
