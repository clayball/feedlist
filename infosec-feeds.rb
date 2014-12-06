#!/usr/bin/env ruby
require 'nokogiri'
require 'open-uri'

class Feed
  attr_accessor :name,:type,:url,:file

  def initialize(name, type, url)
    @name = name
    @type = type
    @url = url
    Dir.mkdir('xml') unless Dir.exists?('xml')
    Dir.mkdir('xml/'+@type) unless Dir.exists?('xml/'+@type)
    @file = "#{@type}_#{@name}.xml"
  end

  def get_feed
    output_path = File.expand_path(File.dirname(__FILE__)) + '/xml/' + type + '/'
    output_file = File.new(output_path+@file, "w")
    puts "[+] Fetching #{@name}\n    from: #{@url}"
    output_file.print Nokogiri::XML(open(@url))
    output_file.close
    puts "[+] #{@name} saved to #{@file}"
  end
end

feed = Feed.new('cert', 'alert', 'http://www.us-cert.gov/ncas/alerts.xml')
feed.get_feed

# XML feed hashes based on type, e.g., vulnerability alerts, infosec news, etc
alertfeeds = {
	alert_cert: 'https://www.us-cert.gov/ncas/alerts.xml',
	alert_nvd: 'https://nvd.nist.gov/download/nvd-rss.xml',
	alert_sans: 'https://isc.sans.edu/rssfeed.xml'
}

vendorfeeds = {
	vendor_cisco: 'http://tools.cisco.com/security/center/psirtrss20/CiscoSecurityAdvisory.xml'
}

newsfeeds = {
	news_sans: 'https://isc.sans.edu/newssummaryrss.xml',
	news_threatpost: 'http://threatpost.com/feed'
}

blogfeeds = {
	blog_moxie: 'http://www.thoughtcrime.org/blog/rss.xml',
	blog_krebs: 'http://krebsonsecurity.com/feed/'
}
