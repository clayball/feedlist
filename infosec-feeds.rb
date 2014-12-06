#!/usr/bin/env ruby

# Fetch XML based RSS feeds from various information security websites.
# - save the XML file for processing later.. possibly in various ways/functions
#
# The original idea was to fetch feeds specifically related to alerts and advisories related to software
# vulnerabilities. It might be useful to include other classifications of sources, e.g., favorite blogs,
# news, and (cough..cough) vendors. 
#
# The following sources are fetched
# ---------------------------------
#
# - US-CERT is part of DHS' National Cybersecurity and Communications Integration Center (NCCIC).
#   The Department of Homeland Security's United States Computer Emergency Readiness Team (US-CERT)
#   leads efforts to improve the nation's cybersecurity posture, coordinate cyber information sharing,
#   and proactively manage cyber risks to the Nation while protecting the constitutional rights of Americans.
# - NVD is the U.S. government repository of standards based vulnerability management data represented
#   using the Security Content Automation Protocol (SCAP). This data enables automation of vulnerability
#   management, security measurement, and compliance. NVD includes databases of security checklists,
#   security related software flaws, misconfigurations, product names, and impact metrics.
# - Cisco Security Advisories
#   PSIRT manages the receipt, investigation, and public reporting of security vulnerability information related
#   to Cisco products and networks. Subscribe to the Cisco Security Advisory RSS Feed to receive information
#   about significant security issues that directly involve Cisco products and require an upgrade, fix, or other
#   customer action.
# - TODO: add more sources
#         More sources will allow us to collorelate data across sources and possibly make decisions based
#         on patterns found across many sources. For example, an SSH vulnerability is blowing up everywhere..
#         ..we should pay special attention to this vulnerability ASAP.


# TODO: migrate to nokogiri instead.
require 'nokogiri'
require 'open-uri'

####################
# NOTES            #
####################
# 
####################

# XML Feed Symbols
alertfeeds = {
	cert: 'https://www.us-cert.gov/ncas/alerts.xml',
	nvd: 'https://nvd.nist.gov/download/nvd-rss.xml',
	sans: 'https://isc.sans.edu/rssfeed.xml'
	# add more feeds
}

vendorfeeds = {
	cisco: 'http://tools.cisco.com/security/center/psirtrss20/CiscoSecurityAdvisory.xml'
}

newsfeeds = {
	threatpost: 'http://threatpost.com/feed'
}

####################
# Functions        #
####################
def get_feeds(feeds)
	print "[+] Fetching feeds.. \n"
	# Loop through xmlfeeds and fetch each RSS XML file.. we can play with these file locally later.
	feeds.each_pair do |key, value|
		#fout.print "Start: #{Time.now}\n"
		xmlout = File.new("xml/#{key}.xml", "w")
		print "[+] Fetching #{key} at #{value}\n"
		doc = Nokogiri::XML(open("#{value}"))
		xmlout.print doc
		print "[+] ..#{key} file saved to xml/#{key}.xml\n"
	end
	print "[+] Fetch complete\n"
	return "success"
end
# End Functions
####################

####################
# Main             #
####################
get_feeds_result = get_feeds(alertfeeds)
print "[info] get_feeds_result: #{get_feeds_result}\n"

get_feeds_result = get_feeds(vendorfeeds)
print "[info] get_feeds_result: #{get_feeds_result}\n"

get_feeds_result = get_feeds(newsfeeds)
print "[info] get_feeds_result: #{get_feeds_result}\n"

# Use nokogiri to open and parse the XML files we downloaded.
#f = File.open(".xml")
#doc = Nokogiri::XML(f)
#f.close
