#!/usr/bin/env ruby

require "colorize"

require_relative "utils"
utils = Utils.new

if utils.check_os == "win"
    require "win32console"
end

class Logger

	def message msg
        puts "[M] ".white + msg
    end

    def debug msg
        puts "[D] ".blue + msg
    end

    def custom msg, clr, bg
        puts msg
    end

    def service msg
        puts "[SERVICE] ".white + msg
    end

end