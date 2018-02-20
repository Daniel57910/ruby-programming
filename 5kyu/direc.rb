=begin
	solution to this kata: https://www.codewars.com/kata/directions-reduction/train/ruby
=end

$NORTH = "NORTH"
$SOUTH = "SOUTH"
$EAST = "EAST"
$WEST = "WEST"

$NVAL = 1
$SVAL = -1
$EVAL = 2
$WVAL = -2
$OPOS = 0

#function for removing opposite elements from array
def delete(j, i, array)

	array.delete_at(j)
	array.delete_at(i)

	return array

end

#function for returning simplified array
def solve(chars, ints)

	j = chars.length-1
	i = j-1

	loop do

		if ints[j] + ints[i] == $OPOS
			chars = delete(j, i, chars)
			ints = delete(j, i, ints)
			j = chars.length-1
			i = j-1
		else
			j-=1
			i-=1
		end

		break if chars.length == 1 or j<=0
		#exit loop if array has 1 element or all values evaluated

	end

	return chars

end

def dirReduc(a)

  if a == nil
    return []
  end

	if a.length == 0 or a == nil
		return []
	end

	direcInt = []

	for i in 0..a.length-1
		if a[i] == $NORTH
			direcInt[i] = $NVAL
		elsif a[i] == $SOUTH
			direcInt[i] = $SVAL
		elsif a[i] == $EAST
			direcInt[i] = $EVAL
		else
			direcInt[i] = $WVAL
		end
	end

	#print direcInt
	solved = solve(a, direcInt)

	return solved

end


#main program

	puts "enter directions"
	a = gets
	#print a
	res = dirReduc(a)
	print res

#end of main
