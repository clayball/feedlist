#!/usr/bin/env ruby
require_relative "feed"

feed_sources = begin
          YAML.load(File.open('feed_sources.yml'))
        rescue ArgumentError => e
          puts "Could not parse YAML: #{e.message}"
        end

feed_sources.each do |value|
  f = Feed.new(value[:name], value[:type], value[:url])
  f.download_feed
end
