module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    for element in self
      yield element, index
      index += 1
    end
  end

  def my_select
      arr = []
      for element in self
        arr << element if yield element
      end

      return arr
  end

  def my_all?
    bool = false
    values = 0
    elements = 0
    for element in self
      elements += 1
      values +=1 if yield element
    end
    if elements == values
      return true
    end
    return bool
  end

  def my_any?
    bool = false
    for element in self
      if yield element
         return true
      end
    end
    return bool
  end

  def my_none?
    bool = true
    values = 0
    elements = 0
    for element in self
      if yield element
        return false
      end
      elements += 1
      values +=1 if yield element
    end
    if elements == values
      return false
    end
    return bool
  end

  def my_count
    count = 0
    return count = self.size unless block_given?
    for element in self
      count +=1 if yield element
    end
    return count
  end

  def my_map
    arr = []
    if block_given?
      self.each do |element|
        arr << yield(element)
      end
      return arr
    else
      return arr
    end
  end

  def my_inject(intial_value)
    sum = intial_value
    self.each do |element|
      sum = yield(sum, element)
    end
    return sum
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
      for element in self
        yield element
      end
  end
end
