# feedlist #

The original idea was to fetch RSS feeds specifically related to security
alerts and advisories and build some intelligence around the data.

TODO: add more details


## Running ##

### Configure RSS Feeds ###

Edit config/feed_sources.yml

We've include a number of security related RSS feeds. Add/remove to your liking.


### Generate your feedlist.htm file ###

Run this to apply changes made to config/feed_sources.yml.

  rake genlist


### Run ###

Fetch the feeds by running..

  ruby bin/feedlist

Cron jobs can be setup a number of different ways. You will likely have your own
preferred way of doing this. This is what I've done.

I created the following shell script that will run via cron.

  #!/bin/bash
  #
  # cd to the feedlist directory and run feedlist
  cd $HOME/local/feedlist
  bin/feedlist

Create the cronjob.

  crontab -e

  # run feedlist every hour at 10 after
  10 * * * * /home/$USER/bin/cron-feedlist.sh

After this is in place, open htdocs/index.html.


### View ###

Open htdocs/index.html in your browser of choice.


## Customizing ##

Aside from adding the RSS feeds of your choice you can also customize the CSS
for your index.html file and .htm files.


