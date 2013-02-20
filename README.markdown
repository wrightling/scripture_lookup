Scripture Lookup Gem  [![Build Status](https://travis-ci.org/wrwright/scripture_lookup.png)](https://travis-ci.org/wrwright/scripture_lookup)  [![Code Climate](https://codeclimate.com/github/wrwright/scripture_lookup.png)](https://codeclimate.com/github/wrwright/scripture_lookup)
====================

Providers a clean interface to common scripture providers, such as Crossways ESV and Bible Gateway.

Current (default) provider is BibleGatewayScraper, which pulls back scripture from Bible Gateway.

This is a work in progress and all feedback or collaboration is welcome.

Progress Thus Far
-----------------

A screen-scrape interface to [Bible Gateway](http://biblegateway.com) has been implemented and provides (by far) the most comprehensive list of translations available.

The [Crossways ESV API](http://esvapi.org) provider is a work in progress on the [crossways](https://github.com/wrwright/scripture_lookup/tree/crossways) branch.

Usage
-----

    gem install scripture_lookup
    require 'scripture_lookup'

Shortcut to bring back a BibleGatewayScraper instance:

    provider = ScriptureLookup.new

Example usage - #to_s to pull back the text only:

    response = provider.lookup("John 3:16", :NASB)
    response.to_s
    
    => "\“For God so loved the world, that He gave His only begotten Son, that whoever believes in Him shall not perish, but have eternal life."

Example usage - #verses to pull back an array of verses

    response = provider.lookup("1 Thess 5:16-18", :ESV)
    response.verses
    
    => ["Rejoice always,",
        "pray without ceasing,",
        "give thanks in all circumstances; for this is the will of God in Christ Jesus for you."]

The ScriptureLookup::Response object also gives access to the full response data, by way of the #response_data accessor.
* This is a fairly complicated collection of hashes and arrays.
* See comments in [response.rb](lib/scripture_lookup/response.rb) for the dirty details.

Command Line Interface
----------------------

Installation of this gem includes a command line interface.  To utilize, call "scripture <reference>, <translation>" from the command line.

<translation> defaults to "NASB" if none is provided.

The command line interface utilizes the Bible Gateway screen-scrape provider.

ex.

    scripture "John 3:16", NASB
    scripture "John 3:16"
    scripture "Psalm 23", ESV
    scripture "Rom 12:1-2", NIV

Error Handling
--------------

Taking a page from Avdi Grimm's [Exceptional Ruby](http://exceptionalruby.com/) book, any errors that descend from StandardError are caught and wrapped in a namespaced error ([ScriptureLookup::Error](https://github.com/wrwright/scripture_lookup/blob/crossways/lib/scripture_lookup/errors/error.rb)) before they are allowed to unwind back tot he client application.

This is true of any public interface into the gem.

To Do
-----
* Refactor
  [CrosswaysEsvProvider](lib/scripture_lookup/crossways_esv_provider.rb)
to utilize the new [Response](lib/scripture_lookup/response.rb) object.
* Refactor the [Response](lib/scripture_lookup/response.rb) object's @response_data structure into something more object-oriented than the
current hash of hashes/arrays.
* Obtain credentials and access to the new Bible Gateway API and implement a non-screen-scraped provider.
