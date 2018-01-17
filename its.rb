=begin
	builds on int to string with spelling out numbers
=end

#function to convert number to array 
def intToArray num
	
	count = 0
	numArray = []
	while num > 0
		while num % 10 != 0
			num-=1
			count+=1
			#puts num
			#puts count
		end
		num /=10
		#puts "Count entering array is #{count}"
		numArray.push count
		count = 0
	end

	return numArray

end

#function to reverse order of the array for printing
def revArray backNums

	len = backNums.length - 1
	count = 0
	orderedArray = []
	
	while (len) >=0
		orderedArray[count] = backNums[len]
		len-=1
		count+=1
		#puts "Ordered array is #{orderedArray}"
	end

	return orderedArray

end

#function for converting the array into words
def convertToWords intArray

	ones = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
	tens = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
	mids = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]

	len = intArray.length - 1
	wordArray = []
	flag = 0

	for i in 0..len
		puts "i is #{i.to_s}"
		puts "int is #{intArray[i].to_s}"
	#syntax for for loop, from 0 <= n
		if i == 0 and intArray[i] > 0
			wordArray.push ones[ (intArray[i]) - 1]
			flag = 1
		end

		if i == 1 and intArray[i] == 1
			wordArray.pop
			use = intArray[i - 1]
			wordArray.push tens[use]
			#pops out old element to add eleven <= n <= nineteen
		end

		if i == 1 and intArray[i] > 1
			wordArray.push mids[ (intArray[i]) - 1]
			#adds twenty <= n <= ninety
		end

		if i == 2 and intArray[i] > 0 
			wordArray.push ones[ (intArray[i]) - 1] + "-" + "hundred"
			#adds one <=n <= nine + hundred
		end

		if i == 3 and intArray[i] > 0
			wordArray.push ones[ (intArray[i]) - 1] + "-" + "thousand"
			#adds one <=n <=n + thousand
		end

		if i == 4 and intArray[i] == 1
			wordArray.pop
			use = intArray[i - 1]
			wordArray.push tens[use] + "-thousand"
			# 11 <= n <= nineteen thousand
		end

		if i == 4 and intArray[i] > 1
			if intArray[i - 1] > 0
				wordArray.push mids[ (intArray[i]) - 1]
			elsif 
				wordArray.push mids[ (intArray[i]) - 1] + "-thousand"
				#edge case for ten thousand/ eleven thousand
			end
		end

		if i == 5 and intArray[i] > 0
			if intArray[i - 1] == 0 and intArray[i - 2] == 0
				wordArray.push ones[ (intArray[i]) - 1] + "-" + "hundred-thousand"
				#edge case for one hundred thousand/ two hundred thousand
			elsif 
				wordArray.push ones[ (intArray[i]) - 1] + "-hundred"
			end
		end

	puts "inside word array is #{wordArray}"
	end

	puts "final word array is #{wordArray}"

	return wordArray

end


#main program 

	puts "Enter a number"

	userNum = gets.chomp.to_i
	intArray = intToArray userNum
	#intArray 329 = [9][2][3]

	wordArray = convertToWords intArray 
	
	wordArray = revArray wordArray

	puts wordArray.to_s

	for i in 0..wordArray.length - 1
		print "#{wordArray[i].to_s}" + " "

	end

#end of main program

