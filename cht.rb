=begin
	
O(n) solution to kata
https://www.codewars.com/kata/is-my-friend-cheating/train/ruby

=end

#function for converting integer to array
def getProduct(n, current)

	hold = (0.5 * n * (n + 1) - current) / (1 + current)
	#maths for working out whether ab = n - a - b
	return hold
	
end

def removNb(n)

	product = Array.new

	for i in 1..n
		check = getProduct(n, i)
		if check < n and check.to_i == check
			product << [i, check.to_i]
		end
	end
 
	return product

end

#main program

	#puts "Enter integer to find factors"
	ans = gets.to_i
	res = removNb(ans)

	print res

#end of main
