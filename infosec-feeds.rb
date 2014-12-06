#!/usr/bin/env ruby
require 'nokogiri'
require 'open-uri'

class Feed
  attr_accessor :name, :type, :url, :file

  def initialize(name, type, url)
    @name = name
    @type = type
    @url = url
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

# XML feed hashes based on type, e.g., vulnerability alerts, infosec news, etc
alert = {
  cert: 'https://www.us-cert.gov/ncas/alerts.xml',
  nvd: 'https://nvd.nist.gov/download/nvd-rss.xml',
  sans: 'https://isc.sans.edu/rssfeed.xml'
}

vendor = {
  cisco: 'http://tools.cisco.com/security/center/psirtrss20/CiscoSecurityAdvisory.xml',
  aws: 'http://aws.amazon.com/rss/security.rss',
  ibm: 'http://www.iss.net/rss.php'
}

news = {
  sans: 'https://isc.sans.edu/newssummaryrss.xml',
  threatpost: 'http://threatpost.com/feed'
}

blog = {
  moxie: 'http://www.thoughtcrime.org/blog/rss.xml',
  krebs: 'http://krebsonsecurity.com/feed/'
}
