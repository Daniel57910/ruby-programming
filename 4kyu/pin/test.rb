#program not going to work currently, need to update permutation algorithm

$PIN = 
	[ 
	[nil, nil, nil, nil, nil], 
	[nil, 1, 2, 3, nil], 
	[nil, 4, 5, 6, nil], 
	[nil, 7, 8, 9, nil], 
	[nil, nil, 0, nil, nil] 
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
			#puts "current is #{current}"
			@options.merge!(current)
		}

	
	end

	def getPerms

		@optsArray = @optsArray.join.split""
		@optsArray = @optsArray.combination(@options.length)
		@options.each { | key, val | print "#{key}: " + val.to_s + "\n" }
		

	end

end

#beginning of main

	puts "enter permutation combination"
	num = gets.chomp

	perms = CrackSafe.new(num)
	perms.getPerms
	
#end of main


	