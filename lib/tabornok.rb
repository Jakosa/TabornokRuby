#!/usr/bin/env ruby

require_relative "tabornok/irc"
require "colorize"
require "thread"

class Tabornok

    def initialize
        puts "Tabornok IRC Bot and Framework".yellow
        puts "Copyright (C) 2012 Jackneill".yellow
        puts "This program comes with ABSOLUTELY NO WARRANTY; for details type see <http://www.gnu.org/licenses/>.".yellow
        puts "This is free software, and you are welcome to redistribute it".yellow
        puts "under certain conditions; for details type see <http://www.gnu.org/licenses/>.".yellow

        irc = Irc.new
        irc.connect "irc.rizon.net", 6667
        irc.auth "Tabornok"

        thread_read_irc = Thread.new irc.read_irc

        console = Console.new
        thread_read_console = Thread.new console.read_console
    end

end

tabornok = Tabornok.new
tabornok.connect