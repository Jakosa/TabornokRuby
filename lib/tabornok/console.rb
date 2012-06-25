#!/usr/bin/env ruby

require "tabornok/irc"

class Console

	def read_console
        puts "[C] Console read Thread initialized".red

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