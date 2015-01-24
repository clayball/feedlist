# feedlist #

The original idea was to fetch RSS feeds specifically related to security
alerts and advisories and build some intelligence around the data.

TODO: add more details


## Running ##

### Configure RSS Feeds ###

Edit config/feed_sources.yml

TODO: add details

### Generate your feedlist.htm file ###

Run this to apply changes made to config/feed_sources.yml.

  rake genlist

### Run ###

  ruby bin/feedlist

### View ###

Open htdocs/feedlist.htm in your browser of choice.


## Customizing ##

Aside from adding the RSS feeds of your choice you can also customize the CSS
for your feedlist.htm file and feed.htm files.


## Versioning Details ##

We'll be using semantic versioning:

  PATCH 0.0.x level changes for implementation level detail changes, such as
    small bug fixes.
  
  MINOR 0.x.0 level changes for any backwards compatible API changes, such as
    new functionality/features.
  
  MAJOR x.0.0 level changes for backwards incompatible API changes, such as
    changes that will break existing users code if they update.

Based on the above version 1.x.x may never exist. So the major number will
increase after substantial changes have been made, e.g. 0.99.x to 1.0.x.

