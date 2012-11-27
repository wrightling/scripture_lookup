require 'json'

module ScriptureLookup

  ##
  # Pulls back plain text scripture for the given reference and
  # translation.
  #
  # Example:
  #   curl -G "http://beta.biblegateway.com/api/1/bible/John.3.16/esv"
  class BibleGatewayProvider
    def lookup reference, translation
    end
  end
end
