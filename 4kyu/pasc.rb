


def getFactorial fact
	fact = (1..fact).reduce(:*)
	#iterates through every number, storing the result of the value * operation
end


def	pascalsTriangle(n)

	triangle = []

	count = 1

	while n > 0
		factTree = getFactorial(n)
		puts "factTree is #{factTree}"
		count = 1
		while count < n
			count+=1
		end
		n-=1
	end

end


#beginning of main

	puts "enter number to view triangle"
	n = gets.to_i

	pascalsTriangle(n)

#end of main