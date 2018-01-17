=begin
	simple program to demonstrate life of a Chris Pine Chapter 9 tree life with interaction from user.
=end

#class for executing the orange tree
class OrangeTree 

		def initialize (height, years, dead)
		#obtains instance variables for use throughout the program
			@height = height
			@years = years
			@dead = dead
		end

		def getTreeHeight
		#function for determining life of tree and oranges

			bad = "terrible."
			okay = "okay."
			good = "delicious."
			@orangeCount = 0

			while @years < @dead
				puts "Tree is #{@years.to_s} old and #{@height.to_s}cm tall. "
				@height+=5
				@years+=1

				if @years > 2 and @years != @dead
					@orangeCount +=3
					print "There are ##{@orangeCount} oranges on the tree."
					puts "Do you want to take an orange?"
					ans = gets.chomp
					
					@orangeCount-=1
					if ans == "yes"
						print "Your orange was "
						num = rand(3)
						if num == 0
						#random numbers generated to determine orange type
							print bad
						elsif num == 1
							print okay
						elsif num == 2
							print good
						end
					puts ""
					else
						print "The orange fell off anyway. "
					end

				end
			end
			puts "Tree is #{@years.to_s} and dead"
		end

end


#main program

	treeL = 210
	years = 1
	dead = 10

	treeHeight = OrangeTree.new(treeL, years, dead)
	#initialize treeheight so instance variables allocated to class.
	treeHeight.getTreeHeight
	#main execution of the program

#end of main program
