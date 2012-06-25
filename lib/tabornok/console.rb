#!/usr/bin/env ruby

require "tabornok/irc"
require "tabornok/console"

class Console

	def read_console
        @logger = Logger.new

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