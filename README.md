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

Aside from adding the RSS feeds of your choice you can also customize the CSS for your
feedlist.htm file and feed.htm files.
