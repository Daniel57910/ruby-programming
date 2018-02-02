$MANS = "m"
$PINS = "p"
$SOUS = "s"
$HONS = "z"

def isCompletedMahjongHand?(hand)

	if hand == nil
		return false
	end

	arrHand = hand
	arrHand = arrHand.split ""
	lastCards = getLastCards(arrHand)
	arrHand = removeLastCards(arrHand)
	
	if checkKoko(arrHand, lastCards) == true
		#puts "Kokushi Musou win"
		return true
	end

	sortedHand = sortHands(arrHand, lastCards)
	mIndex = sortedHand.index($MANS)

	if mIndex != nil
		mHand = handToInt(0, mIndex, sortedHand)
		sortedHand = deleteCards(sortedHand, mIndex)
	end

	pIndex = sortedHand.index($PINS)

	if pIndex != nil
		pHand = handToInt(0, pIndex, sortedHand)
		sortedHand = deleteCards(sortedHand, pIndex)
	end

	sIndex = sortedHand.index($SOUS)

	if sIndex != nil
		sHand = handToInt(0, sIndex, sortedHand)
		sortedHand = deleteCards(sortedHand, sIndex)
	end

	zIndex = sortedHand.index($HONS)

	if zIndex != nil
		zHand = handToInt(0, zIndex, sortedHand)
		sortedHand = deleteCards(sortedHand, zIndex)
	end

	#print "mHand = #{mHand} \npHand = #{pHand} \nsHand = #{sHand}\nzHand = #{zHand}"

	pCount = checkPairs(mHand) + checkPairs(pHand) + checkPairs(sHand) + checkPairs(zHand)
	#puts  "\npCount = #{pCount}"

	if pCount == false
		return false
	end

	if pCount == 7
		#puts "7 pairs"
		return true
	end

	if mIndex != nil
		if checkLast(mHand) == true
			#puts "mHand true"
			mRes = true
		else
			mRes = false
			#puts "mHand false"
		end
	end

	if pIndex != nil
		if checkLast(pHand) == true
			#puts "pHand true"
			pRes = true
		else
			pRes = false
			#puts "pHand false"
		end
	end

	if sIndex  != nil
		if checkLast(sHand) == true
			#puts "sHand true"
			sRes = true

		else
			sRes = false
			#puts "sHand false"
		end
	end

	if zIndex  != nil
		if checkZ(zHand) == true
			#puts "zHand true"
			zRes = true
		else
			#puts "zHand false"
			zRes = false
		end
	end

	#puts "M = #{mRes} P = #{pRes} S = #{sRes} Z = #{zRes}"

	if mRes == false or pRes == false or sRes == false or zRes == false
		return false
	else
		#puts "run + pair"
		return true
	end




end


#function for getting last cards from array
def getLastCards (hand)

	lastCards = Array.new
	lastCards[0] = hand[hand.length - 2]
	lastCards[1] = hand[hand.length - 1]

	return lastCards

end

#function for removing last tiles from character array
def removeLastCards (hand)

	count = 0
	while count < 3
		hand.pop
		count+=1
	end

	return hand

end

#function for checking Kokushi Musou
def checkKoko (hand, lastCards)

	#puts hand.to_s
	#puts lastCards.to_s

	kokoHand = "19m19p19s1234567z"
	kokoHand = kokoHand.split "" 

	if hand == kokoHand 
		if lastCards[1] == "z" or lastCards[0] == "1" or lastCards[0] == "9"
			#puts "first koko test passed"
			#puts "second koko test passed"
			return true
		end
	else
		return false
	end

end


#function for placing cards in correct position in character array
def sortHands (hand, lastCards)

	num = lastCards[0]
	suit = lastCards[1]

	runHand = hand
	indx = runHand.index(suit)
	current = indx - 1

	if num == runHand[current] or num > runHand[current]
		runHand.insert(indx, num)
	else
		while (runHand[current] >= "1" or runHand[current] <= "9") and (num < runHand[current] and num < runHand[current - 1])
			#while current tile is integer/in set and number chosen < current tile checks sorted tiles
			current-=1
		end
		runHand.insert(current, num)
	end

	return runHand

end

#function for deleting cards from  character array whilst sorting character array
def deleteCards (hand, dPoint)

	tempHand = hand

	for i in 0..dPoint
		tempHand.delete_at(0)
	end

	return tempHand

end

#function for converting hand to integer
def handToInt (start, suitEnd, sortedHand)

	tempArray = Array.new

	#puts "start: #{start}. end: #{suitEnd}"

	for i in 0..suitEnd
		tempArray[i] = sortedHand[i]
	end

	tempArray = tempArray.join
	tempArray = tempArray.to_i

	tempArray = intToArray(tempArray)

	return tempArray

end

#function for converting integer to array
def intToArray (arr)

	hold = Array.new

	while arr > 0
		hold.unshift arr % 10
  		arr /= 10
	end

	return hold

end

#function for checking whether 7 pairs are met
def checkPairs (hand)

	i = 0
	j = 1
	current = 0
	count = 0

	if hand == nil
		return 0
	end

	while j < hand.length
		#puts " i is: #{hand[i]} j is #{hand[j]}"
		if hand[i] == hand[j]
			count+=1
			#puts "#{hand[i]} == #{hand[j]}. count is #{count}"
			current = hand[j]	
		end

		i+=2
		j+=2

		if current == hand[i]
			#puts "identitical pairs"
			return false
			#if identitical pairs in array returns 0
		end

	end

	return count

end

#function for checking whether run is met
def checkLast (arr)

	k = arr.length - 1
	j = k - 1
	i = j - 1

	if arr.length == 0
		return true
	end

	#puts "hand is #{arr}"
	#puts "K is #{arr[k]}. J is #{arr[j]}. I is #{arr[i]}"
	#puts "pCount: #{pCount}. tCount: #{tCount}"

	if arr[k] - arr[j] == 1 and arr[j] - arr[i] == 1
		arr.delete_at(k)
		arr.delete_at(j)
		arr.delete_at(i)
		checkLast arr
		
	end
			
	if arr[k] == arr[j] and arr[j] == arr[i]
		arr.delete_at(k)
		arr.delete_at(j)
		arr.delete_at(i)
		checkLast arr
		
	end

	if arr[k] == arr[j]
		arr.delete_at(k)
		arr.delete_at(j)
		checkLast arr
	end
	
end

def checkZ (arr)

	k = arr.length - 1
	j = k - 1
	i = j - 1

	if arr.length == 0
		#base case for empty array
		return true
	end

	#puts "K is #{arr[k]}. J is #{arr[j]}. I is #{arr[i]}"

	if arr[k] == arr[j] and arr[j] == arr[i]
		arr.delete_at(k)
		arr.delete_at(j)
		arr.delete_at(i)
		checkLast arr
			
	elsif arr[k] == arr[j]
		arr.delete_at(k)
		arr.delete_at(j)
		checkLast arr

	else
		return false
	end

end



#driver program

	puts "Enter playing hand"
	playHand = gets.chomp

	result = isCompletedMahjongHand?(playHand)
	puts result.to_s

#end of driver
