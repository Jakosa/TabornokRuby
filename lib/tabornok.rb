#!/usr/bin/env ruby

require "socket"

class Tabornok

	def initialize server, port, nick
		puts <<
			"Tabornok Copyright (C) 2012 Jackneill"
    		"This program comes with ABSOLUTELY NO WARRANTY; for details type see <http://www.gnu.org/licenses/>."
    		"This is free software, and you are welcome to redistribute it"
    		"under certain conditions; type `show c' for details."

		@server = server
		@port	= port
		@nick 	= nick
	end

	def connect
		@tcpsocket = TCPSocket.open @server, @port

		auth
		read
	end

	def auth
		sendIrcMsg "NICK " + @nick
    	sendIrcMsg "USER Tabornok 0 * Tabornok"
    	sendIrcMsg "JOIN #hun_bot"
    end

    def sendIrcMsg s
    	@tcpsocket.puts s
    	puts "[*][*][*] " + s
    end

    def read
    	until @tcpsocket.eof? do
    		data = @tcpsocket.gets

    		puts data
    	end
    end

end

tabornok = Tabornok.new "irc.rizon.net", 6667, "Tabornok"
tabornok.connect