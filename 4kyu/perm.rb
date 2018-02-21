=begin
	
recursive solution to this kata: https://www.codewars.com/kata/permutations

=end

def getPerms(str, char1, char2, vals)

	str = str.split""

	if char1 == str.length or char2 < 0
		return vals.uniq
	end

	str[char1], str[char2] = str[char2], str[char1]

	#print str.join.to_s + "\n"
	vals << str.join
	getPerms(str, char1 + 1, char2, vals)
	#swap character on left side of array
	getPerms(str, char1, char2 - 1, vals)
	#swap character on right side of array
	getPerms(str, char1 + 1, char2 - 1, vals)
	#swap character on both sides of array
	
end
