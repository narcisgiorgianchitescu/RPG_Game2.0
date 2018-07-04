module System_Commands
	def clear_screen
		system 'cls' or system 'clear'
	end

	def sleep_for_seconds(seconds)
		sleep(seconds)
	end
end