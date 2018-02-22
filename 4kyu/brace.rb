=begin
	solution to this kata:
	https://www.codewars.com/kata/valid-braces
=end

#assigns every option numerical value
$PARENTH = {"(" => 1, "[" => 2, "{" => 3, ")" => -1, "]" => -2, "}" => -3}

def isCorrect(vals)

	if vals.length % 2 != 0
		return false
	end

	i = 0
	j = 1
	
	while vals.length != 0

    	if j == vals.length-1 and vals[j] > 0
      		return false

		elsif vals[i] > 0 and vals[j] > 0
			i+=1
			j+=1

		elsif vals[i] + vals[j] != 0
			return false

		elsif vals[i] + vals[j] == 0
			vals.delete_at(i)
			vals.delete_at(i)
			i = 0
			j = 1 
		end

	end

	return true

end

def validBraces(braces)

	braces = braces.split""
  
  	vals = []

	braces.each { | a | 
		var = $PARENTH.fetch(a) 
		vals << var 
	}

	return isCorrect(vals)

end

#main

	ans = gets.chomp
	puts validBraces(ans)

#end of main


=begin
	
def validBraces(braces)

neater solution dragged from codewars and picked apart

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
	
=end

