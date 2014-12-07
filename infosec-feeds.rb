#!/usr/bin/env ruby
require 'open-uri'
require 'yaml'

class Feed
  attr_accessor :name, :type, :url, :file

  def initialize(name, type, url)
    @name, @type, @url = name, type, url
    Dir.mkdir('xml') unless Dir.exist?('xml')
    Dir.mkdir('xml/' + @type) unless Dir.exist?('xml/' + @type)
    @file = "#{@type}_#{@name}.xml"
  end

  def get_feed
    output_path = File.expand_path(File.dirname(__FILE__)) + '/xml/' + type + '/'
    puts output_path
    output_file = File.new(output_path + @file, 'w')
    puts "[+] Fetching #{@name}\n    from: #{@url}"
    File.open(output_file, 'wb') do |file|
      file.write open(url).read
    end
    puts "[+] #{@name} saved to #{@file}"
  end
end

feeds = begin
           YAML.load(File.open('feeds.yml'))
         rescue ArgumentError => e
           puts "Could not parse YAML: #{e.message}"
         end

feeds.each do |value|
  name, type, url = value[:name], value[:type], value[:url]
  f = Feed.new(name, type, url)
  f.get_feed
end
