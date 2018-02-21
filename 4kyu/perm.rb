=begin
	
recursive solution to this kata: https://www.codewars.com/kata/permutations

=end


def permutations(str, char1, char2, vals)

	if char1 == str.length or char2 < 0
		return vals
	end

	str[char1], str[char2] = str[char2], str[char1]

	#print str.join.to_s + "\n"
	vals << str.join
	permutations(str, char1 + 1, char2, vals)
	#swap character on left side of array
	permutations(str, char1, char2 - 1, vals)
	#swap character on right side of array
	permutations(str, char1 + 1, char2 - 1, vals)
	#swap character on both sides of array
	
end









#beginning of main

	puts "enter string"
	ans = gets.chomp
	ans = ans.split""
	vals = []
	print ans
	puts ans.length-1

	vals = permutations(ans, 0, ans.length-1, vals).uniq
	print vals




#end of main