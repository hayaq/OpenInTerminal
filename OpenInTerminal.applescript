on run {input, parameters}
	set terminal_running to 0
	tell application "Finder"
		set theItem to (item 1 of input)
		if (class of ((properties of theItem) as record)) is folder then
			set target_path to POSIX path of input
		else
			set target_path to POSIX path of input
			set target_path to do shell script "dirname \"" & target_path & "\""
		end if
		set procList to name of every application process
		if "Terminal" is in procList then
			set terminal_running to 1
		end if
	end tell
	
	tell application "Terminal"
		activate
		if terminal_running is 1 then
			do script "cd \"" & target_path & "\""
		else
			do script "cd \"" & target_path & "\"" in window 1
		end if
	end tell
	
	return input
end run