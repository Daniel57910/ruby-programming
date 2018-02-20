$CATS = "C"
	$DOGS = "D"
	$DONE = "!"

	def solve (animals, max)

		len = animals.length - 1

		catchQ = getDistance(animals, max, len)

		return catchQ

	end

	def getDistance (animals, max, len)

		dis= 0
		pos1 = 0
		pos2 = 1
		catches = 0

		while (pos2 <= len)
			#puts "pos1 is #{pos1} at [#{animals[pos1]}]. pos2 is #{pos2} at [#{animals[pos2]}]"
			#puts "animal array is #{animals}"
			
			if animals[pos1] == animals[pos2]
				#puts "#{pos1}[#{animals[pos1]}] == #{pos2} [#{animals[pos2]}]."
				pos2+=1
			end

			if animals[pos1] == $DOGS and animals[pos2] == $CATS and pos2 - pos1 <= max
				animals[pos1] = $DONE
				animals[pos2] = $DONE
				catches+=1
				pos1+=1
				pos2+=1
				#puts "successful catch. array is now #{animals}"

			elsif pos2 - pos1 > max
				pos1+=1	
			end

			if animals[pos1] == $CATS and animals[pos2] == $DOGS and pos1 - pos2 >= (max *-1)
				animals[pos1] = $DONE
				animals[pos2] = $DONE
				catches+=1
				pos1+=1
				pos2+=1
				#puts "successful catch. array is now #{animals}"
			elsif pos1 - pos2 < (max *-1)
				pos1+=1
			end

		
			if animals[pos1] == $DONE
				pos1+=1
			elsif animals[pos2] == $DONE
				pos2+=1
			end
	
		end

		return catches

	end

	#main program

	puts "Length of cat and dog array"
	length = gets.to_i

	animalArray = []
	integerArray = []

	length-=1

	for i in 0..length
		animal = gets.chomp.to_s
		animalArray[i] = animal
	end

	puts "Max catch distance"
	max = gets.to_i

	catchQ = solve(animalArray, max)
	puts catchQ

	#end of main