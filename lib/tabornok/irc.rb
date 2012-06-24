#!/usr/bin/env ruby

require "socket"

class Irc

	def connect server, port
		@tcpsocket = TCPSocket.open server, port
	end

	def auth nick
        sendServiceMsg "NICK #{nick}"
        sendIrcMsg "USER #{nick} 0 * #{nick}"
    end

    def sendServiceMsg msg
    	@tcpsocket.puts msg
    end

    def sendIrcMsg chan, msg
        @tcpsocket.puts "PRIVMSG #{chan} :#{msg}"
    end

end