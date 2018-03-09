#solution to this kata: https://www.codewars.com/kata/5531abe4855bcc8d1f00004c

def value_array(frames)
  
  values = []

  frames.each { |current|
    if current == "X" or current == "/"
      values << 10
    else
      values << current.to_i
    end
  }

  values

end


def count_score(frames, values)

  score = [0]
  i = 0
  j = 1
  k = 2
  count = 1

  10.times do
    #is a strike
    if frames[i] == "X"
      if frames[j] and frames[k] == "X"
        score << score[count - 1] + 30
      elsif frames[k] == "/"
        score << score[count - 1] + 20
      else
        score << score[count - 1] + 10 + values[j] + values[k]
      end
      frames.delete_at(i)
      values.delete_at(i)
    #is a spare
    else
      if frames[j] == "/"
        score << score[count - 1] + 10 + values[k]
      #regular shot
      else
        score << score[count - 1] + values[i] + values[j]
      end
      frames.slice!(0, 2)
      values.slice!(0, 2)
    end
    count += 1
  
  end

  return score.last

end

def bowling_score(frames)

  frames = frames.split("")
  frames.delete_if { |char| char == " " }
  values = value_array(frames)
  
  count_score(frames, values)
   
end

  puts "Enter a bowling score"
  frames = gets.chomp
  puts bowling_score(frames)


