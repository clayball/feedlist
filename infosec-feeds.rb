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
    output_file = File.new(output_path + @file, 'w')
    puts "[+] Fetching #{@name} from: #{@url}"
    File.open(output_file, 'wb') do |file|
      file.write open(url).read
    end
    puts "[+] #{@name} saved to #{output_path + @file}"
  end
end

feeds = begin
           YAML.load(File.open('feeds.yml'))
         rescue ArgumentError => e
           puts "Could not parse YAML: #{e.message}"
         end

feeds.each do |value|
  f = Feed.new(value[:name], value[:type], value[:url])
  f.get_feed
end
