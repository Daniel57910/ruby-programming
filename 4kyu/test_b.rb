
def validBraces(braces)

	pairs = {")" => "(", "]" => "[", "}" => "{"}

	puts "Enter a string"
	braces = gets.chomp
	openB = []


	braces.each_char { | c |
		case c
			when "(", "[", "{" then openB << c
			when ")", "]", "}" then return false if stack.pop != pairs[c]
		#if brace is open. then used if true to pipe next command
		end
	}

	stack.empty?
	#contained whether stack is empty inside ?

end
	