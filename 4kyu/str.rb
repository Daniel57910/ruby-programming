=begin
	Solution to this Kata: https://www.codewars.com/kata/strings-mix/train/ruby
=end


#function for getting histograms. returned in array format for easier comparison
def getHistogram(sort)

	if sort == nil
		return
	end

	histoGram = {}
	values = {}
	i = 0
	j = 1

	while j <= sort.length
		if sort[i] == sort[j]
			j+=1
		else
			if j - i > 1
				#more than 1 character in string
				values = {sort[i] => (j-i)}
				histoGram.merge!(values)
			end
			i = j
			j = i + 1
		end
	end

	histoGram = histoGram.to_h

	return histoGram

end

#function for creating master histogram
def checkStrings(st1, st2)

	dups = {}

	st1.each_key { | key |  
		#puts "key is #{key}"
		if st2.has_key?(key) == true 
			val1 = st1.values_at(key).join.to_i
			val2 = st2.values_at(key).join.to_i
			if val1 > val2
				st2.delete(key)
			elsif val1 < val2
				st1.delete(key)
			elsif val1 == val2
				temp = {"=" + key => val1}
				dups = dups.merge(temp)
				st2.delete(key)
				st1.delete(key)	
			end
		end

	}

	if st1 != nil 
		st1 = appendCharacters(st1, "1")
	end

	if st2 != nil
		st2 = appendCharacters(st2, "2")
	end


	finalString = st1.merge(st2).merge(dups).sort_by { | key, value | -value }.to_a.join.split""

	return finalString
	

end

#function for appending string number to hash values
def appendCharacters (string, stringNo)

	string.each { | key, value | 
		temp = {stringNo + key =>value}
		string.delete(key)
		string = string.merge(temp)
	}

	return string

end

#function for sorting string in lexicographic order if = characters
def sortHisto(finalHisto)

	if finalHisto == 0
		return 
	end

	checkST1 = 0
	checkCH1 = 1
	checkNM1 = 2

	checkST2 = 3
	checkCH2 = 4
	checkNM2 = 5

	while checkNM1 < finalHisto.length
		
		if checkNM2 >= finalHisto.length
			checkST1 +=3
			checkCH1 +=3
			checkNM1 +=3
			checkST2 = checkST1 + 3
			checkCH2 = checkCH1 + 3
			checkNM2 = checkNM1 + 3
		end

		if finalHisto[checkNM1 + 1] == nil 
			return finalHisto
		end

		if finalHisto[checkNM1] == finalHisto[checkNM2]
			checkLex = finalHisto[checkST1].to_s <=> finalHisto[checkST2].to_s
			if checkLex > 0
				finalHisto = swap(checkST1, checkCH1, checkNM1, checkST2, checkCH2, checkNM2, finalHisto)
			end
				
		end

		checkST2 +=3
		checkCH2 +=3
		checkNM2 +=3
	
	end

	return finalHisto
			
end

#function for swapping values in final histogram
def swap (st1, char1, num1, st2, char2, num2, array)

	tempST = array[st1]
	tempCH = array[char1]
	tempNM = array[num1]

	array[st1] = array[st2]
	array[char1] = array[char2]
	array[num1] = array[num2]

	array[st2] = tempST
	array[char2] = tempCH
	array[num2] = tempNM

	return array

end

#function for enumerating no of character -> characters eg: a, 5 = aaaaa
def printNums (char, quant)

	temp = []
	quant.times do 
		temp << char
	end

	temp << "/"

	temp = temp.join
	return temp

end

class Solve

	def initialize(s1, s2)

		if s1 != nil
			@s1 = s1.split("").sort.select { | char | char =~/[a-z]/ }
		end

		if s2 != nil
			@s2 = s2.split("").sort.select { | char | char =~/[a-z]/ }
		end

	end

	def getHistos

		@histo1 = getHistogram(@s1)
		@histo2 = getHistogram(@s2)
		#print @histo1.to_s + "\n" + @histo2.to_s	
	
	end

	def makeHisto

		@finalHisto = checkStrings(@histo1, @histo2)
		@finalHisto = sortHisto(@finalHisto) 

	end

	def printHisto

		printArray = []
		str = 0
		char = 1
		quant = 2

		while quant < @finalHisto.length
			temp = printNums(@finalHisto[char], @finalHisto[quant].to_i)
			printArray << @finalHisto[str] + ":"
			printArray << temp
			str+=3
			char+=3
			quant+=3
		end

		printArray = printArray.join
		return printArray

	end

end


#driver function for evaluating code
def mix(s1, s2)

	if s1 == nil and s2 == nil
		return nil
	end

	charCount = Solve.new(s1, s2)
	charCount.getHistos
	charCount.makeHisto
	
	solved = charCount.printHisto
	return solved

end


#main program

	#puts "Enter string one"
	ans1 = gets

	#puts "Enter string two"
	ans2 = gets

	answer = mix(ans1, ans2)
	print answer

#end of main








