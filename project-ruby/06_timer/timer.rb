class Timer
    attr_accessor :seconds
    
    def initialize 
        @seconds = 0
    end    
    
  def time_string
      hour = @seconds/3600
      min = @seconds%3600/60
      seconds = @seconds%60/1
      return string = "#{0 if hour < 10}#{hour}:#{0 if min < 10}#{min}:#{0 if seconds < 10}#{seconds}"
  end 
end
