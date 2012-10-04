Scripture Lookup Gem
====================

Providers a clean interface to common scripture providers, such as
Crossways ESV and Bible Gateway.

This is a work in progress and all feedback is welcome.

Progress Thus Far
-----------------

The [Crossways ESV API](http://esvapi.org) has been implemented so far, 
with options configured to pull back plain text verses with no additional 
formatting.

To Do
-----
* Move the version information out of the gemspec and into
  lib/scripture_lookup/version.rb.
* Design and add in option selection capabilities so the user can choose
  to return verse numbers, footnotes, or other formatting options
presented by the Crossways ESV api.
* Add initial implementation of the [Bible Gateway
  API](http://api.biblia.com/docs) in support of
  other Bible translations.
* Add command line to pull back scripture.
