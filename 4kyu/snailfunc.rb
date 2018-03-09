
$MAX = 5
$DONE = "!"

def printArray(array)

	print "\n"

	array.each do | row |
		print row.to_s + "\n"
	end

end


def snail(array)

	len = array.length
	final = []
	check = 0
	count = 0

	if array == nil
		return array
	end

	while  final.length < (len**2)
		for i in count..len-1
			if array[count][i] != $DONE
				#ink blots traversed cells so not repeated
				final << array[count][i]
				array[count][i] = $DONE
			end
		end
		array = array.transpose.reverse
		check+=1
		if check % 4 == 0
			#if all 4 sides traversed move inward by 1 row
			check = 0
			count +=1
		end

	end

	return final

end

#main

array = Array.new($MAX) {Array.new($MAX){rand(10)}}
printArray(array)
print snail(array)

#end of main
