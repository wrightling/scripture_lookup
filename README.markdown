Scripture Lookup Gem
====================

Providers a clean interface to common scripture providers, such as
Crossways ESV and Bible Gateway.

Current (default) provider is BibleGatewayScraper, which pulls back
scripture from Bible Gateway.

This is a work in progress and all feedback is welcome.

Progress Thus Far
-----------------

The [Crossways ESV API](http://esvapi.org) has been implemented
with options configured to pull back plain text verses with no additional 
formatting.

A screen-scrape interface to [Bible Gateway](http://biblegateway.com)
has been implemented and provides (by far) the most comprehensive list
of translations available.

Command Line Interface
----------------------

Installation of this gem includes a command line interface.  To utilize,
call "scripture <reference>, <translation>" from the command line.

<translation> defaults to "NASB" if none is provided.

The command line interface utilizes the Bible Gateway screen-scrape
provider.

ex.
scripture "John 3:16", NASB
scripture "Psalm 23", ESV
scripture "Rom 12:1-2", NIV

To Do
-----
* Encapsulate the response of #lookup calls into a response object,
  including (at a minimum) support for JSON and text formats.
* Define custom exceptions for the general classes of errors that
  are possible.
* Add initial implementation of the [Bible Gateway
  API](http://beta.biblegateway.com/apidocs) in support of
  other Bible translations.
* Design and add in option selection capabilities so the user can choose
  to return verse numbers, footnotes, or other formatting options 
  presented by the Crossways ESV api.
* Design and add in controller classes to facilitate lookups on various 
  Bible versions.
