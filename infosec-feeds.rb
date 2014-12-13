#!/usr/bin/env ruby
require_relative "feed"

feeds = begin
          YAML.load(File.open('feeds.yml'))
        rescue ArgumentError => e
          puts "Could not parse YAML: #{e.message}"
        end

feeds.each do |value|
  f = Feed.new(value[:name], value[:type], value[:url])
  f.download_feed
end
