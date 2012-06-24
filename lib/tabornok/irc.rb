#!/usr/bin/env ruby

class Irc

	def connect server, port
		@tcpsocket = TCPSocket.open server, port
	end

	def auth nick
        sendIrcMsg "NICK #{nick}"
        sendIrcMsg "USER #{nick} 0 * #{nick}"
    end

    def sendIrcMsg msg
    	@tcpsocket.puts msg
    end

    def sendMsg chan, msg
        @tcpsocket.puts "PRIVMSG #{chan} :#{msg}"
    end

end