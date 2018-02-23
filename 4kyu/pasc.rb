=begin
	
solution to this kata: https://www.codewars.com/kata/5226eb40316b56c8d500030f/solutions/ruby

=end


def getFactorial fact
	fact = (1..fact).reduce(:*)
	#iterates through every number, storing the result of the value * operation
end

def	pascalsTriangle(n)

	triangle = []
	count = 1
	n-=1
	#pascals triangle indexes at 0

	while n >= 0
		tree = getFactorial(n)
		count = 0
		while count <= n
			if count == 0 or count == n
				pos = 1
			else
				current = getFactorial(count)
				neg = getFactorial(n - count)
				pos = tree / (current * neg)
				#uses equation inTriangle = Tree! / (Current! * (T - C)!)
			end
			count+=1
			triangle << pos
		end
		n-=1
	end

	triangle.reverse

end


#beginning of main

	puts "enter number to view triangle"
	n = gets.to_i

	print pascalsTriangle(n)

#end of main