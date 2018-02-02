=begin
solution to this codewars kata: https://www.codewars.com/kata/weight-for-weight/train/ruby
=end
#function for converting character to integer array
def charToInt (strng)

	weightArr = Array.new

	for i in 0..strng.length - 1
		weightArr[i] = strng[i].to_i
	end

	return weightArr

end

def intToChar (strng)

	charArr = Array.new

	for i in 0..strng.length - 1
		charArr[i] = strng[i].to_s

	end

	return charArr


end


#function for sum of numbers eg 231 = 6
def sumOfNums (weightArr)

	intArr = Array.new 
	
	for i in 0..weightArr.length - 1

		sum = 0
		num = weightArr[i].to_i
		while (num > 0)
			#puts "num is #{num}"
			sum+= num % 10
			#puts "sum is % #{sum}"
			num/=10
		end

		intArr[i] = sum

	end

	return intArr

end


def checkifEqual (num)

	while num > 0
		ret = num % 10
		num/=10
		#puts "ret is #{ret}. num is #{num}"
	end

	#puts "returned is #{ret}"
		
	return ret

end

#function for sorting numbers eg a[8] a[23] -> a[23] a[8]
def sortTheNums(intArr, weightArr)

	sortedArr = Array.new

	len = intArr.length - 1

	swapped = true

	while swapped 
		swapped = false
		len.times do | i |
			#puts "#{intArr[i]} #{intArr[i + 1]}"
			
			if intArr[i] > intArr[i + 1]
				intArr[i], intArr[i + 1] = intArr[i + 1], intArr[i]
				weightArr[i], weightArr[i + 1] = weightArr[i+1], weightArr[i]
				swapped = true
			end

			if intArr[i] == intArr[i + 1] 
				#puts "#{intArr[i]} is #{intArr[i + 1]} and #{weightArr[i]} = #{weightArr[i + 1]}"
				check1 = checkifEqual(weightArr[i])
				check2 = checkifEqual(weightArr[i + 1])
				#puts "#{check1} #{check2}"
				if check1 > check2
					intArr[i], intArr[i + 1] = intArr[i + 1], intArr[i]
					weightArr[i], weightArr[i + 1] = weightArr[i+1], weightArr[i]
					swapped = true
				end

			end
			
		end

	end

	return weightArr

end

def order_weight(strng)

	if strng == nil
		return strng
	end

	weights = strng.split(" ")
	#splits into individual arrays
	weightArr = charToInt(weights)

	intArr = sumOfNums(weightArr)
	#print weightArr
	#print"\n"
	#print intArr

	sorted = sortTheNums(intArr,weightArr)
	charArr = intToChar(sorted)
	
	charArr = charArr.join(" ")
	#puts charArr
	return charArr

	

end

#main program

	puts "enter random numbers"
	strng = gets.chomp

	sorted = order_weight(strng)
	puts sorted

#end of main

