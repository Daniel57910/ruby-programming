=begin
	solution to this kata:
	https://www.codewars.com/kata/valid-braces
=end

$PARENTH = {"(" => 1, "[" => 2, "{" => 3, ")" => -1, "]" => -2, "}" => -3}

def isCorrect(vals)

	if vals.length % 2 != 0
		return false
	end

	i = 0
	j = 1

	while vals.length != 0

		#both brackets open
		if vals[i] > 0 and vals[j] > 0
			i+=1
			j+=1

		#open and closed bracked don't match
		elsif vals[j] == nil or vals[i] + vals[j] != 0
			return false

		#successfully closed brackets
		elsif vals[i] + vals[j] == 0
			vals.delete_at(i)
			vals.delete_at(i)
			#puts "vals are #{vals}"
			isCorrect(vals)	 
		end

	end

	#puts "completed and returned true"
	return true

end

def validBraces(braces)
  
  	vals = []

	braces.each { | a | 
		var = $PARENTH.fetch(a) 
		vals << var 
	}

	return isCorrect(vals)

end


#main

  ans = gets.chomp
  
  if ans == nil
    puts "false"
    return false

  else
    ans = ans.split""
	puts validBraces(ans)
  end
	
#end of main

