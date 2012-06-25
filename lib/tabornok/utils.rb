#!/usr/bin/env ruby

class Utils

	def check_os
		if RUBY_PLATFORM.downcase.include?("darwin")
			return "mac"
		elsif RUBY_PLATFORM.downcase.include?("mswin") ||
			RUBY_PLATFORM.downcase.include?("mingw")
			return "win"
		elsif RUBY_PLATFORM.downcase.include?("linux")
			return "linux"
		else
			return "unknown"
		end
	end

end