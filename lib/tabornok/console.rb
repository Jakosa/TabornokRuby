#!/usr/bin/env ruby

require "irc"

class Console

	def read
        while true
            cmd = gets.chomp
            #cmd.inspect

            if cmd[0..2] == "say"
                puts cmd
                sendIrcMsg "#hun_bot", cmd
            end
        end
    end

end