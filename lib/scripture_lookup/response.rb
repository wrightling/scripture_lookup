module ScriptureLookup

  # Response encapsulates the response from any of the various
  # scripture providers.
  #
  # Response.response_data is expected to be a well formatted hash of
  # scripture.  Current hash structure contains the following.
  #   * [:translation] - The name of the translation coming back from the
  #                      provider, such as "English Standard Version (ESV)".
  #   * [:content] - A hash of scripture, where each key is reference, such
  #                  as "Col-1-9" or "Ps-23-2".
  #   * [:content][<ref>][:title] - Either nil or a string containing a
  #                                 title for that verse.
  #   * [:content][<ref>][:subtitle] - Either nil or a string containing
  #                                    a subtitle for that verse.
  #   * [:content][<ref>][:verse] - An array of strings containing the scripture
  #                                 for that verse.  This allows us to maintain
  #                                 linebreaks between each portion of the verse
  #                                 if desired (often Psalms and other poetic
  #                                 sections of Scripture place linebreaks in the midst
  #                                 of each verse).
  class Response
    attr_reader :response_data

    def initialize(response_data)
      @response_data = response_data
    end

    def verses
      response_data[:content].values.inject([]) do |res, verse|
        res + verse[:verse]
      end
    end

    # Default implementation of to_s simply returns the text for each
    # verse as a single paragraph (no line breaks).
    def to_s
      response_data[:content].values.inject("") do |res, verse|
        res += " " unless res.empty?
        res + verse[:verse].join(" ")
      end
    end
  end
end
