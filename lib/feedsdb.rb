# class-feeds-db.rb

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
