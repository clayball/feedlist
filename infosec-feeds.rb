#!/usr/bin/env ruby
require 'open-uri'
require 'yaml'

class Feed
  attr_accessor :name, :type, :url, :file_name, :output_path

  def initialize(name, type, url)
    @name, @type, @url = name, type, url
    @file_name = "#{@type}_#{@name}.xml"
    @output_path = File.expand_path(File.dirname(__FILE__)) +
                   '/xml/' + @type + '/'
  end

  def mkdirs
    Dir.mkdir('xml') unless Dir.exist?('xml')
    Dir.mkdir('xml/' + @type) unless Dir.exist?('xml/' + @type)
    self
  end

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
end

feeds = begin
          YAML.load(File.open('feeds.yml'))
        rescue ArgumentError => e
          puts "Could not parse YAML: #{e.message}"
        end

feeds.each do |value|
  f = Feed.new(value[:name], value[:type], value[:url])
  f.download_feed
end
