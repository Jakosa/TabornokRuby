#!/usr/bin/env ruby

class Logger

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

end