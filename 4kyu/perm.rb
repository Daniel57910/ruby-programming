#solution using ruby functions: https://www.codewars.com/kata/permutations/train/ruby

def permutations(string)

	string = string.split""
	perms = string.permutation(string.length).to_a
	final = []
	
	perms.each do | perm | 
		perm = perm.join
		final << perm
	end

	final = final.uniq.sort

end



#beginning of main

	string = gets.chomp
	print permutations(string)

#end of main

=begin
	
recursive solution 

def permutations(string)

	string = string.split""
	perms = []
	perms = getPerms(string, 0, string.length-1, perms)
	perms

end

def getPerms(str, char1, char2, vals)

	if char1 == str.length or char2 < 0
		return vals.uniq.sort
	end

	str[char1], str[char2] = str[char2], str[char1]
	vals << str.join
	#print "vals are #\n#{vals}"
	getPerms(str, char1 + 1, char2, vals)
	getPerms(str, char1, char2 - 1, vals)
	getPerms(str, char1 + 1, char2 - 1, vals)

end


tst = gets.chomp
print permutations(tst)

=end
