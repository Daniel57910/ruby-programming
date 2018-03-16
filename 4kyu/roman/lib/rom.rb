VALUES = {
  1000 => "M",
  900 => "MC",
  500 => "D",
  400 => "DC",
  100 => "C",
  90 => "CX",
  50 => "L",
  40 => "LX",
  10 => "X",
  9 => "XI",
  5 => "V",
  4 => "VI",
  1 => "I"
}
def conv(number)
  VALUES[number]
end