#!/usr/bin/env ruby

class Parser

	def parse *data
        #data.inspect
        puts data

        case data[1]
        when "NOTICE"
        when "PRIVMSG"
            case data[2]
            when "AUTH"
            end
        end
    end

end