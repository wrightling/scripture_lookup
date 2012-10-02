Scripture Lookup Gem
====================

This gem is a work in progress and will provide a clean user interface
to pull back text from the Bible.

Progress Thus Far
-----------------

The only provider that has been implemented is to the [Crossways ESV
API](http://esvapi.org), with options configured to pull back plain text
verses with no additional formatting or verse numbers.

To Do
-----
* Refactor the main ScriptureLookup class into a module (no need to
  maintain state in an object foreseen).
* Move the version information out of the gemspec and into
  lib/scripture_lookup/version.rb.
* Design and add in option selection capabilities so the user can choose
  to return verse numbers, footnotes, or other formatting options
presented by the Crossways ESV api.
* Add initial implementation of the [Bible Gateway
  API](http://api.biblia.com/docs) in support of
  other Bible translations.
