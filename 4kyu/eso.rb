#solution to this kata: passing 102/104 tests https://www.codewars.com/kata/esolang-interpreters-number-2-custom-smallfuck-interpreter/ruby

COMMANDS = "<>*[]"
MOVES = {">" => 1, "<" => -1}
LEFT = 1
RIGHT = -1

def find_close (c, codes)

  brackets = 1
  #ensures nested brackets are accounted for eg [[<>[**<>]<*>s]]
  while brackets > 0 && brackets < codes.length
    c += 1
    if codes[c] == "["
      brackets += 1
    elsif codes[c] == "]"
      brackets -= 1
    end
  end
  return c

end

def find_open (c, codes)
 
  brackets = 1
  while brackets > 0 and brackets < codes.length
    c -= 1
    if codes[c] == "]"
      brackets += 1
    elsif codes[c] == "["
      brackets -= 1
    end
  end
  return c

end

def interpreter code, tape

  codes = []
  tape = tape.split""
  code.each_char { |move| codes << move if COMMANDS.include?(move) == true }

  t = 0
  #index for tape
  c = 0
  #index for codes

  while c < codes.length

    if t < 0 or t >= tape.length then break end
    current = codes[c]
    case current
      when "<", ">"
        t += MOVES.fetch(current)
        #tape index moves left or right depending on command
      when "*" 
        if tape[t] == "1" then tape[t] = "0" else tape[t] = "1" end
      when "[" 
        if tape[t] == "0" then c = find_close(c, codes) end  
      when "]"
        if tape[t] == "1" then c = find_open(c, codes) end
    end

    c += 1
    
  end

  return tape.join
  
end

#beginning of main

  puts "Enter code"
  code = gets.chomp
  puts "Enter tape"
  tape = gets.chomp

  puts interpreter(code, tape)

#end of main