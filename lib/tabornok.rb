#!/usr/bin/env ruby

require_relative "tabornok/irc"
require_relative "tabornok/logger"
require "thread"

class Tabornok

    @logger = Logger.new

    def initialize
        puts "Tabornok IRC Bot and Framework"
        puts "Copyright (C) 2012 Jackneill"
        puts "This program comes with ABSOLUTELY NO WARRANTY; for details type see <http://www.gnu.org/licenses/>."
        puts "This is free software, and you are welcome to redistribute it"
        puts "under certain conditions; for details type see <http://www.gnu.org/licenses/>."

        irc = Irc.new
        irc.connect "irc.rizon.net", 6667
        irc.auth "Tabornok"

        irc.joinchan "#hun_bot"
        irc.joinchan "#Tabornok"

        thread_read_irc = Thread.new irc.read_irc

        console = Console.new
        thread_read_console = Thread.new console.read_console
    end

end

tabornok = Tabornok.new
tabornok.connect