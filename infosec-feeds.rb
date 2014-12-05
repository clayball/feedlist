#!/usr/bin/env ruby

# Fetch XML based feeds from various information security
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

require 'curb'    # Ruby bindings for libcurl
#require 'thread'

# XML Feed Symbols
xmlfeeds = {
	cert: 'https://www.us-cert.gov/ncas/alerts.xml',
	nvd: 'https://nvd.nist.gov/download/nvd-rss.xml'
	# add more feeds here
}

fout = File.new("feeds.log", "w")

xmlfeeds.each_pair do |key, value|
	fout.print "Start: #{Time.now}\n"
	xmlout = File.new("xml/#{key}.xml", "w")
	fout.print "[+] Fetching #{key} at #{value}\n"
	http = Curl.get("#{value}")
	xmlout.print http.body_str
end

fout.print "[+] Fetch complete: #{Time.now}\n"
