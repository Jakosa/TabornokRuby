#!/usr/bin/env ruby

require "socket"
require "colorize"

class Tabornok

	def initialize server, port, nick
        puts "Tabornok IRC Bot and Framework".yellow
		puts "Copyright (C) 2012 Jackneill".yellow
    	puts "This program comes with ABSOLUTELY NO WARRANTY; for details type see <http://www.gnu.org/licenses/>.".yellow
    	puts "This is free software, and you are welcome to redistribute it".yellow
    	puts "under certain conditions; for details type see <http://www.gnu.org/licenses/>.".yellow

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

    def sendIrcMsg msg
    	@tcpsocket.puts msg

        log 4, msg
    end

    def log lvl, msg
        case lvl
        when 1
            puts "[1] ".red + msg
        when 2
            puts "[2] ".yellow + msg
        when 3
            puts "[3] ".blue
        when 4
            puts "[4] ".green + msg
        when 5
            puts "[5] " + msg
        else
            puts "[ERROR] " + msg
        end
    end

    def read
    	until @tcpsocket.eof? do
    		parse @tcpsocket.gets
    	end
    end

    def parse data
        puts data
    end

end

tabornok = Tabornok.new "irc.rizon.net", 6667, "Tabornok"
tabornok.connect