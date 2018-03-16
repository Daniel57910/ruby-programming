#solution to kata: https://www.codewars.com/kata/52742f58faf5485cae000b9a

TIMES = [" second", " minute", " hour", " day", " year"]
DAY = 24
YEAR = 365

class Convert

  def initialize(seconds)
    @seconds = seconds
    @values = []
  end

  def is_a_day
    count = 1
    2.times do 
      @values << @seconds % 60
      @seconds /= 60
      count+=1   
      puts "going into loop are #{@seconds}" 
      print "values = #{@values}" 
    end

    @values << @seconds
    puts "final = #{@values}"

    if @values.last >= 24
      @values = more_than_day(DAY, @values)
    end

    return @values
    
  end

  def calculate

    @time = []
    @values.each_index {|x| 
      if @values[x] > 1 
        @time << @values[x].to_s.concat(TIMES[x]).concat("s")
      elsif @values[x] == 1
         @time << @values[x].to_s.concat(TIMES[x])
      end
    }

    return @time.join if @time.length == 1

    return parse_array

  end

  private

  def more_than_day(count, val_array)

    print val_array
    day_count = 0
    hours = val_array.pop

    puts "hours = #{hours}"

    while hours >= count
      hours -= count
      day_count+=1
      puts "hours are #{hours}"
      puts "daycount is #{day_count}"
    end

    val_array << hours << day_count

    if val_array.last >= 365
      val_array = more_than_day(YEAR, val_array)
    end

    val_array

  end



  def parse_array
    @time.reverse!
    last = @time.pop
    @time = @time.join(", ").concat(" and ").concat(last)
  end


end


def format_duration(seconds)

  if seconds == 0
    return "now"
  end

  readable = Convert.new(seconds)
  readable.is_a_day
  readable.calculate
   
end













