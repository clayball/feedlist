#!/usr/bin/env ruby
require 'open-uri'
require 'yaml'

# A class for retrieving xml files for Rss feeds
class Feed

  # -name: name of feed
  attr_accessor :name
  # -type: type of feed (ie. blog, alert, vendor, etc)
  attr_accessor :type
  # -url: url where xml file is located
  attr_accessor :url
  # -file_name: name of local output file derived from type and name
  attr_reader :file_name
  # -output_path: local output path
  attr_reader :output_path

  def initialize(name, type, url)
    @name, @type, @url = name, type, url
    @file_name = "#{@type}_#{@name}.xml"
    @output_path = File.expand_path(File.dirname(__FILE__)) +
      '/xml/' + @type + '/'
  end

  # A method that creates the directory where xml is stored locally
  def mkdirs
    Dir.mkdir('xml') unless Dir.exist?('xml')
    Dir.mkdir('xml/' + @type) unless Dir.exist?('xml/' + @type)
    self
  end

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
end
