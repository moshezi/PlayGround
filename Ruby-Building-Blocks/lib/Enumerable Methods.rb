module Enumerable
  def my_each
    for element in self
      yield(element)
    end
  end


  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
    end
  end


  def my_select
    array = []
    for element in self
      if yield(element)
        array.push(element)
      end
    end
    return array
  end


  def my_all?
  		for element in self
  			if block_given?
  				unless yield(element)
  					return false
  				else
  					return true
  				end
  			else
  				unless element
  					return true
  				end
  			end
  		end
  		return true
  	end


    def my_any?
      for element in self
        if block_given?
          if yield(element)
            return true
          end
        else
          if element
            return true
          end
        end
      end
      return false
    end


    def my_none?
		 for element in self
			if block_given?
				if yield(element)
					return false
				end
			else
				if element
					return false
				end
			end
		end
		return true
	end


  def my_count
    count = 0
    for element in self
      if block_given?
        if yield(element)
          count += 1
        end
      else
        count +=1
      end
    end
    return count
  end


  def my_map(code = nil)
		map_array = []
		for element in self
			if code == nil
				map_array.push(element)
			elsif block_given?
				map_array.push(yield(code.call(element)))
			else
				map_array.push(code.call(element))
			end
		end
		return map_array
	end



  def my_inject(memo = nil)
  if memo.nil?
    memo = self[0]
    i = 1
  else
    i = 0
  end

  while i < self.size
    memo = yield(memo,self[i])
    i += 1
  end
  return memo
end

def multiply_els(array)
    array.my_inject { |memo, element| memo * element }
  end

end
