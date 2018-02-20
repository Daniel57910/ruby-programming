=begin

	solution to this kata: https://www.codewars.com/kata/greed-is-good

=end

$MAX = 5

class Solve

	def initialize(dice, score)

		@dice = dice
		@score = score

	end

	def convScore

		print @dice.to_s + "\n"
		for i in 0..@dice.length-1
			@score[@dice[i] - 1] +=1
			#for every dice rolled, score table incremented by 1
		end

		print @score

	end

	def getScore

		count = 0

		for i in 0..@score.length - 1

			if i == 0
				if @score[i] < 3
					count += @score[i] * 100
				else
					count+= 1000 + ((@score[i] - 3) * 100)
				end

			elsif i == 4
				if @score[i] < 3
					count+=@score[i] * 50
				else
					count+= 500 + ((@score[i]-3) * 50)
				end

			else
				if @score[i] >= 3
					count += 100 * (i + 1)
				end
			end

		end

		return count

	end

end


def score dice

	results = []

	for i in 0..$MAX
		results[i] = 0
		#set all results to 0
	end

	count = Solve.new(dice, results)
	count.convScore

	count = count.getScore

	return count


end


#main program

	dice = []
	res = score(dice)
	print res

#end of main
