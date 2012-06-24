#!/usr/bin/env ruby

require "socket"
require "parser"

class Irc

	def connect server, port
		@tcpsocket = TCPSocket.open server, port
	end

	def read_irc
		parser = Parser.new

    	until @tcpsocket.eof? do
    		parser.parse @tcpsocket.gets
    	end
    end

	def auth nick
        sendServiceMsg "NICK #{nick}"
        sendServiceMsg "USER #{nick} 0 * #{nick}"
    end

    def sendServiceMsg msg
    	@tcpsocket.puts msg
    end

    def sendIrcMsg chan, msg
        @tcpsocket.puts "PRIVMSG #{chan} :#{msg}"
    end

end