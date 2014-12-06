#!/usr/bin/env ruby
require 'nokogiri'
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
    puts "[+] Fetching #{@name}\n    from: #{@url}"
    output_file.print Nokogiri::XML(open(@url))
    output_file.close
    puts "[+] #{@name} saved to #{@file}"
  end
end

config = begin
           YAML.load(File.open('feeds.yml'))
         rescue ArgumentError => e
           puts "Could not parse YAML: #{e.message}"
         end
puts config
