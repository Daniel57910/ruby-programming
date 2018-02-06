=begin

Solution to this Kata:
https://www.codewars.com/kata/did-i-finish-my-sudoku/train/ruby

=end

$MAX = 9

#function for checking columns and rows of sudoku board
def checkSides (cols)

	checkCols = cols.sort
	#takes sorted array, checks for dups or uncompleted squares
	for i in 0..cols.length-1
		if checkCols[i] == checkCols[i + 1] or checkCols[i] == 0
			return false
		end
	end

end

#function for evaluating whether sudoku block is legal 
def evaluate board

	board.each do | side |
		if(checkSides(side) == false)
			#print "false\n"
			return false
		end
	end

end

def printBoard (board)

	board.each do | brd |
		print brd
		print "\n"
	end

end

#function for obtaining 9 square segments of board and returning 1d array
def getSegments (xStart, xEnd, yStart, yEnd, board)

	segBoard = Array.new
	ind = 0
	for i in xStart..xEnd
		for j in yStart..yEnd
			segBoard[ind] = board[j][i]
			ind+=1
		end
	end 

	return segBoard

end

#function for dividing board into 9 square segments and evaluating for dups or 0s
def divBoard (board)

	xStart = 0
	yStart = 0
	xEnd = 2
	yEnd = 2
	count = 0

	while count < $MAX

		segBoard = getSegments(xStart, xEnd, yStart, yEnd, board)

		if checkSides(segBoard) == false
			return false
		end

		count+=1

		if count % 3 == 0
			xStart+=3
			xEnd+=3
			yStart = 0
			yEnd = 2
		else 
			yStart+=3
			yEnd+=3
		end

	end

end

#main function for evaluating sudoku board
def done_or_not(board)

	printBoard(board)
	rowBoard = board.transpose
	
	if evaluate(board) == false or evaluate(rowBoard) == false or divBoard(board) == false
		return false
	end
	
end
#beginning of main

	board = 
	([[5, 3, 4, 6, 7, 8, 9, 1, 2], 
	[6, 7, 2, 1, 9, 5, 3, 4, 8],
	[1, 9, 8, 3, 4, 2, 5, 6, 7],
	[8, 5, 9, 7, 6, 1, 4, 2, 3],
	[4, 2, 6, 8, 5, 3, 7, 9, 1],
	[7, 1, 3, 9, 2, 4, 8, 5, 6],
	[9, 6, 1, 5, 3, 7, 2, 8, 4],
	[2, 8, 7, 4, 1, 9, 6, 3, 5],
	[3, 4, 5, 2, 8, 6, 1, 7, 9]])

	#Array.new($MAX){Array.new($MAX){0} } initialize 2d array. element in 1d enumerated to contigous elements, set inside block

	if done_or_not(board) == false
		puts "Try again!"
	else
		puts "Finished!"
	end
	
#end of main







=begin

#failing test case

incorrectly placed 0s

[
[5, 3, 4, 6, 7, 8, 9, 1, 2], 
[6, 7, 2, 1, 9, 0, 3, 4, 9],
[1, 0, 0, 3, 4, 2, 5, 6, 0],
[8, 5, 9, 7, 6, 1, 0, 2, 0],
[4, 2, 6, 8, 5, 3, 7, 9, 1],
[7, 1, 3, 9, 2, 4, 8, 5, 6],
[9, 0, 1, 5, 3, 7, 2, 1, 4],
[2, 8, 7, 4, 1, 9, 6, 3, 5],
[3, 0, 0, 4, 8, 1, 1, 7, 9]
]

last column fails + 2nd last fails

[ 
[ 1, 3, 2, 5, 7, 9, 4, 6, 8 ],
[ 4, 9, 8, 2, 6, 1, 3, 7, 5 ],
[ 7, 5, 6, 3, 8, 4, 2, 1, 9 ],
[ 6, 4, 3, 1, 5, 8, 7, 9, 2 ],
[ 5, 2, 1, 7, 9, 3, 8, 4, 6 ],
[ 9, 8, 7, 4, 2, 6, 5, 3, 1 ],
[ 2, 1, 4, 9, 3, 5, 6, 8, 7 ],
[ 3, 6, 5, 8, 1, 7, 9, 2, 4 ],
[ 8, 7, 9, 6, 4, 2, 1, 3, 5 ] 
]


last column fail

[[1, 3, 2, 5, 7, 9, 4, 6, 8], 
[4, 9, 8, 2, 6, 1, 3, 7, 5], 
[7, 5, 6, 3, 8, 4, 2, 1, 9], 
[6, 4, 3, 1, 5, 8, 7, 9, 2], 
[5, 2, 1, 7, 9, 3, 8, 4, 6], 
[9, 8, 7, 4, 2, 6, 5, 3, 1], 
[2, 1, 4, 9, 3, 5, 6, 8, 7], 
[3, 6, 5, 8, 1, 7, 9, 2, 4], 
[8, 7, 9, 6, 4, 2, 1, 3, 5]]

segments fail

[
[1, 2, 3, 4, 5, 6, 7, 8, 9],
[2, 3, 4, 5, 6, 7, 8, 9, 1],
[3, 4, 5, 6, 7, 8, 9, 1, 2],
[4, 5, 6, 7, 8, 9, 1, 2, 3],
[5, 6, 7, 8, 9, 1, 2, 3, 4],
[6, 7, 8, 9, 1, 2, 3, 4, 5],
[7, 8, 9, 1, 2, 3, 4, 5, 6],
[8, 9, 1, 2, 3, 4, 5, 6, 7],
[9, 1, 2, 3, 4, 5, 6, 7, 8]
]


passing case

([[5, 3, 4, 6, 7, 8, 9, 1, 2], 
[6, 7, 2, 1, 9, 5, 3, 4, 8],
[1, 9, 8, 3, 4, 2, 5, 6, 7],
[8, 5, 9, 7, 6, 1, 4, 2, 3],
[4, 2, 6, 8, 5, 3, 7, 9, 1],
[7, 1, 3, 9, 2, 4, 8, 5, 6],
[9, 6, 1, 5, 3, 7, 2, 8, 4],
[2, 8, 7, 4, 1, 9, 6, 3, 5],
[3, 4, 5, 2, 8, 6, 1, 7, 9]])

=end
