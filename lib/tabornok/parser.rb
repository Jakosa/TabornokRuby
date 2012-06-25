#!/usr/bin/env ruby

require_relative "irc"

class Parser

	def parse *data
        #data.inspect
        puts data

        puts "Parse is in action".red

        case data[1]
        when "NOTICE"
            case data[2]
            when "AUTH"
            end
        when "PING"
            sendServiceMsg "PONG #{data[2]}"
        when "PRIVMSG"
            case data[2]
            when "AUTH"
            end
        end
    end

end