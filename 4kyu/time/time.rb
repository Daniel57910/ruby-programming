TIMES = [" second", " minute", " hour", " day", " year"]

class Convert

  def initialize(seconds)
    @seconds = seconds
    @values = []
  end

  def is_a_day
    3.times do 
      @values << @seconds % 60
      @seconds /= 60    
      puts "values = #{@values} current = #{@seconds}"
    end
    @values
  end



  def calculate

    @time = []
    @values.each_index {|x| 
      puts "x is #{x}"
      if @values[x] > 1 
        @time << @values[x].to_s.concat(TIMES[x]).concat("s")
      elsif @values[x] == 1
         @time << @values[x].to_s.concat(TIMES[x])
      end
      puts "time is #{@time}"
    }

    print @time.reverse

  end


end


def format_duration(seconds)

  readable = Convert.new(seconds)
  
  values = readable.is_a_day
  if values.length <= 3 then readable.calculate end
   
end













