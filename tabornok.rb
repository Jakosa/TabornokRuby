#!/usr/bin/env ruby

require "socket"

class Tabornok

	def initialize
		connect "irc.rizon.net", 6667, "Tabornok"
	end

	def connect(server, port, nick)
		@tcpsocket = TCPSocket.open(server, port)

		read
	end

	def auth(nick)
		sendIrcMsg "NICK Tabornok"
    	sendIrcMsg "USER Tabornok 0 * Tabornok"
    	sendIrcMsg "JOIN #hun_bot"
    end

    def sendIrcMsg s
    	@tcpsocket.puts s
    end

    def read
    	until @tcpsocket.eof? do
    		data = @tcpsocket.gets

    		puts data
    	end
    end
    
end

tabornok = Tabornok.new