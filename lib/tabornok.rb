#!/usr/bin/env ruby

require "socket"
require "colorize"
require "thread"

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
		thread_read_tcpsocket = Thread.new read_tcpsocket
        thread_read           = Thread.new read
	end

	def auth
        sendIrcMsg "NICK #{@nick}"
        sendIrcMsg "USER Tabornok 0 * Tabornok"
        sendIrcMsg "JOIN #hun_bot"
    end

    def sendIrcMsg msg
    	@tcpsocket.puts msg
    end

    def sendMsg chan, msg
        @tcpsocket.puts "PRIVMSG #{chan} :#{msg}"
    end

    def log lvl, msg
        case lvl
        when 1
            puts "[1] #{msg}".red
        when 2
            puts "[2] #{msg}".yellow
        when 3
            puts "[3] #{msg}".blue
        when 4
            puts "[4] #{msg}".green
        when 5
            puts "[5] #{msg}"
        else
            puts "[ERROR] #{msg}"
        end
    end

    def read_tcpsocket
    	until @tcpsocket.eof? do
    		parse @tcpsocket.gets
    	end
    end

    def parse *data
        data.inspect
        puts data

        case data[1]
        when "NOTICE"
        when "PRIVMSG"
            case data[2]
            when "AUTH"
            end
        end
    end

    def read
        while true
            cmd = gets.chomp
            #cmd.inspect

            if cmd[0, 2] == "say"
                puts cmd
                sendMsg "#hun_bot", cmd
            end
        end
    end

end

tabornok = Tabornok.new "irc.rizon.net", 6667, "Tabornok"
tabornok.connect