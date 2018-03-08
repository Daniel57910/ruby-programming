#program not going to work currently, need to update permutation algorithm

$PIN = 
	[ 
	[nil, nil, nil, nil, nil], 
	[nil, 1, 2, 3, nil], 
	[nil, 4, 5, 6, nil], 
	[nil, 7, 8, 9, nil], 
	[nil, nil, 0, nil, nil],
	[nil, nil, nil, nil, nil]
]


class CrackSafe

	#function for getting all relevant number for perms
	def initialize(strings)

		@options = {}
		@optsArray = []
		current = {}
		count = 0

		strings.each_char { | num | num = num.to_i

			hold = []

			row = $PIN.detect { | ind | ind.include?(num)}
			#identifies the row of the 2d array with the number
			indx = [row.index(num), $PIN.index(row)]
			#identifies the column 

			row = indx[0]
			col = indx[1]

			hold << num
			hold << $PIN[col][row + 1]
			hold << $PIN[col][row - 1]
			hold << $PIN[col + 1][row]
			hold << $PIN[col - 1][row]

			@optsArray << hold
			#holds all the possible combinations

			hold.delete_if { | i | i == nil }

			current = {count => hold}
			count+=1
			@options.merge!(current)
			
		}

	
	end

	def getPerms

		@optsArray = @optsArray.join.split""
		perms = @optsArray.combination(@options.length)
		#every single permutation of password
		final  = []

		perms.each { | perm | 
			if isValid(perm) == true
				final << perm.join.to_s
			end
		}

		final = final.uniq
		puts "combos are: \n"
		final.each { | array | print array.to_s + "\n" }

	end

	def isValid(current)
		for i in 0..current.length-1
			@options[i] = @options[i].to_a
			if @options[i].include?(current[i].to_i) == false
				return false
			end
		end

		return true

	end

end

#beginning of main

	puts "enter permutation combination"
	num = gets.chomp
	perms = CrackSafe.new(num)
	perms.getPerms
	
#end of main


#adapted for codewars. challenge completed

=begin
	
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

=end
	