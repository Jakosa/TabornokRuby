#!/usr/bin/env ruby

require_relative "irc"
require_relative "logger"

class Parser

	def parse data
        @logger = Logger.new

        #data.inspect
        @logger.service data.to_s

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