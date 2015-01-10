#!/usr/bin/env ruby

require 'open-uri'
require 'yaml'
require 'rss'

# Implement infosecfeeds namespace
module infosec-feeds

  # A class for retrieving xml files for Rss feeds
  class Feed

    # -name: name of feed
    attr_accessor :name
    # -type: type of feed (ie. blog, alert, vendor, etc)
    attr_accessor :type
    # -url: url where xml file is located
    attr_accessor :url
    ## -file_name: name of local output file derived from type and name
    #attr_reader :file_name
    ## -output_path: local output path
    #attr_reader :output_path

    def initialize(name, type, url)
      @name, @type, @url = name, type, url
      #@file_name = "#{@type}_#{@name}.xml"
      #@output_path = File.expand_path(File.dirname(__FILE__)) + '/xml/' + @type + '/'
    end

    # Using 'rss' to fetch feed data instead of downloading the xml file.
    # A method that creates the directory where xml is stored locally
    #def mkdirs
    #  Dir.mkdir('xml') unless Dir.exist?('xml')
    #  Dir.mkdir('xml/' + @type) unless Dir.exist?('xml/' + @type)
    #  self
    #end

    # A method that calls mkdirs, and downloads the xml file
    def download_feed
      mkdirs
      output_file = File.new(@output_path + @file_name, 'w')
      begin
        File.open(output_file, 'wb') do |file|
          file.write open(url).read
        end
      rescue StandardError
        STDERR.puts "Failed to download #{@url}:\n #{$ERROR_INFO}"
      end
      self
    end

    # A method that fetches the feeds listed in feed_sources.yml
    # TODO:
    # - IMPORTANT: sanitize feed/item results before inserting into db
    # - Do we want or need the description data for each item for all feeds
    #   or do we want to be selective and only grab description data from selected sources?
    def fetch_feed
      # encoding: ascii
      # These items will need to be added to the DB (if new)
      # Writing to a log (htm) file that we can open in a browser (tread carefully here)
      File.open("logs/#{name}.htm", "w") do |f|
        begin
          open(url) do |rss|
            feed = RSS::Parser.parse(rss)
            # write to log file and stdout
            f.puts "<!DOCTYPE html>"
            f.puts "<html><head><meta charset=\"utf-8\">"
            f.puts "<title>InfoSec Feeds - #{feed.channel.title}</title>"
            f.puts "</head>"
            f.puts "<body>"
            puts "[+] Fetching feed: #{feed.channel.title}"
            feed.items.each do |item|
              f.puts "<hr>"
              f.puts "<b>Title:</b> #{item.title}<br>"
              f.puts "<b>Date:</b> #{item.date}<br>"
              f.puts "<b>Link:</b> <a href='#{item.link}'>#{item.link}</a><br>"
              f.puts "<b>Description:</b><br>" #if name == 'krebs'
              f.puts "<p>#{item.description}</p>" #if name == 'krebs'
              f.puts "<hr>"
            end
            puts "[+] Fetch complete"
            f.puts "</body>"
            f.puts "</html>"
            #f.puts "Complete"
          end
        rescue StandardError
          STDERR.puts "Failed to fetch #{@url}:\n #{$ERROR_INFO}"
        end
      end
    end

  end # class

end # module
