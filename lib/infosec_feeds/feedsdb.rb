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
################################################################################

# Class: feedsdb
# Usage: require-relative 'lib/class-feedsdb.rb'

class FeedsDB
	# class vars
	attr_reader :host
	attr_reader :port
	attr_reader :database
	attr_reader :user
	attr_reader :pass
	attr_reader :conn

	def initialize
		# do stuff
		@host = 'localhost'
		@port = 5436
		@database = 'isfeeds'
		@user = 'user'
		@pass = 'pass'
		@conn
	end

	def connect
		#conn = PGconn.connect("#{@host}", port, '', '', 'factsim', 'postgres', '')
		puts "[test] Connection string: #{@host},#{@port}, '', '', '#{database}', '#{user}', '#{pass}'"
	end

	def close
		conn.finish
	end

end
