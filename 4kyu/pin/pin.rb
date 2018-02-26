
$PIN = 
	[ 
	[nil, nil, nil, nil, nil], 
	[nil, 1, 2, 3, nil], 
	[nil, 4, 5, 6, nil], 
	[nil, 7, 8, 9, nil], 
	[nil, nil, 0, nil, nil] 
]


def printPin(pin)

	$PIN.each do | row |
		print row.to_s + "\n"
	end

end


class CrackSafe

	#function for getting all relevant number for perms
	def initialize(strings)
		@ops = []
		@length = strings.length

		strings.each_char { | num | 
			#identifies index of each element then adds it to array
			num = num.to_i
			@ops << num

			row = $PIN.detect { | ind | ind.include?(num)}
			ind = [row.index(num), $PIN.index(row)]
			rowi = ind[0]
			col = ind[1]

			@ops << $PIN[col][rowi + 1]
			@ops << $PIN[col][rowi - 1]
			@ops << $PIN[col + 1][rowi]
			@ops << $PIN[col - 1][rowi]
		}

		@ops = @ops.uniq.delete_if { | x | x == nil }.sort

	end


	def getPerms 
		puts "number for perms are #{@ops}. length is #{@length}"
	end

end



#beginning of main

	puts "enter permutation combination"
	num = gets.chomp

	perms = CrackSafe.new(num)
	perms.getPerms
	
#end of main


	