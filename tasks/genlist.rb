###############################################################################
# This file is part of Infosec-Feeds
#
# Infosec-Feeds is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the Free
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.
#
# Infosec-Feeds is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
# more details.
#
# You should have received a copy of the GNU General Public License
# along with Infosec-Feeds.  If not, see <http://www.gnu.org/licenses/>.
###############################################################################

require 'yaml'

feed_sources = 
	begin
    YAML.load(File.open('config/feed_sources.yml'))
  rescue ArgumentError => e
    puts "Could not parse YAML: #{e.message}"
  end

File.open("htdocs/feedlist.htm", "w") do |f|
  f.puts "<!DOCTYPE html>"
  f.puts "<html>"
  f.puts "<head><title>InfoSec Feeds List</title></head>"
  f.puts "<body>"
  f.puts "<h2>InfoSec Feeds List</h2>"
  f.puts "<ul>"
	feed_sources.each do |value|
  	f.puts "<li>#{value[:type]} - <a href='#{value[:name]}.htm'>#{value[:name]}</a>"
 end # each
 f.puts "</ul>"
 f.puts "</body></html>"
end # File.open loop

puts "[+] feedlist.htm has been created."
