
def printPin(pin)

	pin.each do | row |
		print row.to_s + "\n"
	end

end


#beginning of main

	num = []
	current = 9

	pin = [ [nil, nil, nil, nil, nil], [nil, 1, 2, 3, nil], [nil, 4, 5, 6, nil], [nil, 7, 8, 9, nil], [nil, nil, 0, nil, nil] ]
	
	row = pin.detect { | num | num.include?(current)}
	ind = [row.index(current), pin.index(row)]
	row = ind[0]
	col = ind[1] 

	print "row = #{row} col = #{col}"
	num << pin[col][row]
	num << pin[col][row + 1]
	num << pin[col][row - 1]
	num << pin[col + 1][row]
	num << pin[col - 1][row]
	print num
	





#end of main


	