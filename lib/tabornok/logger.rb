#!/usr/bin/env ruby

require "colorize"

require_relative "utils"
utils = Utils.new

if utils.check_os == "win"
    require "win32console"
end

class Logger

	def Message msg
        puts msg
    end

    def Custom msg, clr, bg

    end

end