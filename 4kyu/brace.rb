=begin

	solution to this kata:
	https://www.codewars.com/kata/valid-braces

=end

$PARENTH = {"(" => 1, "[" => 2, "{" => 3, ")" => -1, "]" => -2, "}" => -3}

def isCorrect(vals)

	if vals.length % 2 != 0
		puts "odd number so false"
		return false
	end

	i = 0
	j = 1

	while vals.length != 0

		puts "I is #{i}. J is #{j}. keys are #{vals[i]} and #{vals[j]}"
		if vals[i] > 0 and vals[j] > 0
			puts "both open"
			i+=1
			j+=1

		elsif vals[j] == nil or vals[i] + vals[j] != 0
			puts "failure. vals are #{vals}"
			return false
		#successfully closed brackets
		elsif vals[i] + vals[j] == 0
			vals.delete_at(i)
			vals.delete_at(i)
			puts "vals are #{vals}"
			isCorrect(vals)	 
		end

	end

	puts "completed and returned true"
	return true

end

def validBraces(braces)
  
  	vals = []

	braces.each { | a | 
		var = $PARENTH.fetch(a) 
		vals << var 
	}

	print "\n" + braces.to_s
	print vals.to_s + "\n"

	isCorrect(vals)

end


#main

	puts "enter a string"
	ans = gets.chomp.split""
	validBraces(ans)
	
#end of main


