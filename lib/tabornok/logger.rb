#!/usr/bin/env ruby

require_relative "utils"
utils = Utils.new

if check_os == "win"
    require "win32console"
end

require "colorize"

class Logger

	def Message msg
        puts msg
    end

    def Custom msg, clr, bg

    end

end