require 'multi_json'

module ScriptureLookup

  # Response encapsulates the response from any of the various
  # scripture providers.
  #
  # Response.data is expected to be a well formatted hash of
  # scripture.  While any structure is allowed, it is advantageous
  # for the provider to populate this class with a hash containing
  # the following keys.
  #   * :title - Any title provided by the scripture provider, such
  #              as "For God So Loved the World", which is provided
  #              by BibleGateway.com for the ESV translation of
  #              John 3:16.
  #   * :reference - The full reference coming back from the provider
  #                  that describes the section of scripture, such as
  #                  "Psalm 23:1-4".
  #   * :translation - The name of the translation coming back from the
  #                    provider, such as "English Standard Version (ESV)".
  #   * :verses - A hash containing all verses in the section of scripture.
  #               Each key is a verse number and each value is the full
  #               text for that verse.
  class Response
    attr_reader :data

    def initialize(data)
      @data = data
    end

    # Default implementation of to_s simply returns the text for each
    # verse, separated by newline characters.
    def to_s()
      verses = @data[:verses]
      if verses != nil
        verses.values.join("\n")
      else
        ""
      end
    end

    def to_json()
      MultiJson.dump @data
    end
  end
end
