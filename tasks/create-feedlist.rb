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
  	f.puts "<li><a href='#{value[:name]}.htm'>#{value[:name]}</a>"
 end # each
 f.puts "</ul>"
 f.puts "</body></html>"
end # File.open loop

puts "[+] feedlist.htm has been created."
