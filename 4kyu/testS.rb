
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