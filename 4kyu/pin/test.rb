#completed to work with code wars
$PIN = 
	[ 
	[nil, nil, nil, nil, nil], 
	[nil, 1, 2, 3, nil], 
	[nil, 4, 5, 6, nil], 
	[nil, 7, 8, 9, nil], 
	[nil, nil, 0, nil, nil] 
]

def get_pins(observed)

 	options = {}
	optsArray = []
	current = {}
	count = 0

	observed = observed.split""

	observed.each do | num |

		num = num.to_i
		hold = []
		row = $PIN.detect { | ind | ind.include?(num)}
		indx = [row.index(num), $PIN.index(row)]

		row = indx[0]
		col = indx[1]

		hold << num
		hold << $PIN[col][row + 1]
		hold << $PIN[col][row - 1]
		hold << $PIN[col + 1][row]
		hold << $PIN[col - 1][row]

		optsArray << hold
		hold.delete_if { | i | i == nil }
		current = {count => hold}
		count+=1
		options.merge!(current)
    
    end


	return getPerms(optsArray, options)

end

def getPerms(optsArray, options)

	optsArray = optsArray.join.split""
	perms = optsArray.combination(options.length)
	#every single permutation of password
	final  = []

	perms.each do | perm |
		if isValid(perm, options) == true
			final << perm.join.to_s
		end
	end

	return final.uniq
	
end

def isValid(current, options)
	
	for i in 0..current.length-1
		options[i] = options[i].to_a
		if options[i].include?(current[i].to_i) == false
			return false
		end
	end

	return true

end


puts "enter password"
pass = gets.chomp
puts get_pins(pass)

