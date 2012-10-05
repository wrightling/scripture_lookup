require 'httparty'

module ScriptureLookup
  class BibliaProvider

    ##
    # Takes both a reference and a translation; returns a plain text translation.
    #
    # Example:
    #  curl -X GET -d "passage=John3.16&key=c96a9a1e68c80d8d14d990ffada473da" http://api.biblia.com/v1/bible/content/LEB.js 
    def lookup reference, translation
      puts "http://api.biblia.com/v1/bible/content/#{translation}.js?passage=#{URI.escape(reference)}&key=c96a9a1e68c80d8d14d990ffada473da"
      HTTParty::get("http://api.biblia.com/v1/bible/content/#{translation}.js?passage=#{URI.escape(reference)}&key=c96a9a1e68c80d8d14d990ffada473da")
    end
  end
end
