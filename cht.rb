=begin
	
Brute force solution to kata
https://www.codewars.com/kata/is-my-friend-cheating/train/ruby

=end

#function for converting integer to array
def intArray(n)

	oneToN = Array.new

	for i in 0..n-1
		oneToN[i] = i + 1
	end

	return oneToN

end

def checkProducts(cons, array)

	len = array.length
	product = Array.new
	fst = Array.new

	for i in 0..len-1
		for j in i +1..len
			#puts array[i].to_s + " " + array[j].to_s
			val = array[i].to_i * array[j].to_i
			check = cons - (array[i].to_i + array[j].to_i)
			#puts "val is #{val}. check is #{check}"

			if val == check
				fst[0] = array[i] 
				fst[1] = array[j]
				product[0] = fst
				product[1] = fst.reverse
				#print product
				return product
			end
		end
	end

	return product

end

def removNb(n)

	product = Array.new

	if n == 0 or n == 1
		#if number 0 or 1 then no product
		return product
	end

	oneToN = intArray(n)
	#print oneToN
	cons = (n * (n + 1)) / 2
	#constant sum of arithmetic series

	product = checkProducts(cons, oneToN)
	return product

end

#main program

	#puts "Enter integer to find factors"
	ans = gets.to_i
	res = removNb(ans)

	print res
#end of main