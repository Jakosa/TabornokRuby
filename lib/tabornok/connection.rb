#!/usr/bin/env ruby

require "socket"

class Connection

	def connect server, port, nick
		@tcpsocket = TCPSocket.open server, port
	end

end