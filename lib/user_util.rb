module UserUtil
  
  # return the triangle numbers up to the first number being > count
  def triangle_numbers(count)
    numbers = Array[1]
    n = 2
    while numbers.last < count
      numbers << numbers.last + n
      n += 1 
    end
    numbers
  end
end