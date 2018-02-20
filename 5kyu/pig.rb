=begin

	Solution to this kata: https://www.codewars.com/kata/simple-pig-latin/train/ruby

=end


$AY = "ay"

def pig_it text

  if text == nil
    return text
  end

	pigText = text.split("")

	i = 0
	j = 1

	while j < pigText.length
		if pigText[j]=~/[a-zA-Z]/
			#expression to check whether character alphabetical
			j+=1
		else
			pigText = change_string(pigText, i, j-1)
			i = j+2
			j = i+1
		end
	end

	if pigText[j - 1] =~/[a-zA-Z]/
		pigText = change_string(pigText, i, j-1)
	end

	pigText = pigText.join
	return pigText


end


def change_string (text, loc1, loc2)

	add = text[loc1]
	text.delete_at(loc1)
	text.insert(loc2, $AY)
	text.insert(loc2, add)

	return text

end


#main program

	puts "Enter a string to get it changed"
	ans = gets

	ans = pig_it(ans)
	print ans

#end of main
