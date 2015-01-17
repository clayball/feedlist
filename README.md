# feedslist #

Fetch RSS feeds from various information security websites.
- save the XML file for processing later.. possibly in various ways/functions
The original idea was to fetch feeds specifically related to alerts and advisories relate
vulnerabilities. It might be useful to include other classifications of sources, e.g., fa
news, and (cough..cough) vendors. 


## Running ##

### Configure RSS Feeds ###

Edit config/feed_sources.yml

TODO: add details

### Generate your feedlist.htm file ###

  rake genlist

### Run ###

  ruby bin/feedlist

### View ###

Open htdocs/feedlist.htm in your browser of choice.


## Customizing ##

Aside from adding the RSS feeds of your choice you can also customize the CSS for your
feedlist.htm file and feed.htm files.
