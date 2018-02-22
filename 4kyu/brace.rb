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

		#both brackets open
		
		#last bracket open
    	if j == vals.length-1 and vals[j] > 0
    		#puts "last bracket open. exit loop"
      		return false

		elsif vals[i] > 0 and vals[j] > 0
			#puts "both brackets open"
			i+=1
			j+=1

		#open and closed bracked don't match
		elsif vals[i] + vals[j] != 0
			return false

		#successfully closed brackets
		elsif vals[i] + vals[j] == 0
			vals.delete_at(i)
			vals.delete_at(i)
			#puts "successul delete. vals are #{vals}"
			i = 0
			j = 1 
			#puts "after recur i is #{i}. j is #{j}"
		end

		#puts "i is #{i}. j is #{j}"
		#puts "val i is #{vals[i]}. j is #{vals[j]} "
		#puts "vals length is #{vals.length}"

	end

	#puts "completed and returned true"
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

