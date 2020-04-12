module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    i = 0
    while i < size
      yield(self[i])
      i += 1
    end
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    j = 0
    while j < size
      yield(self[j], j)
      j += 1
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    my_array = []
    my_each do |element|
      my_array << element if yield(element)
    end
    my_array
  end

  def my_all?(block = false)
    if block
      my_each { |x| return false unless block == x }
    elsif !block_given?
      my_each { |x| return false unless x }
    else
      my_each { |x| return false unless yield(x) }
    end
    true
  end

  def my_any?(block = false)
    if block
      my_each { |x| return true if block == x }
    elsif !block_given?
      my_each { |x| return true if x }
    else
      my_each { |x| return true if yield(x) }
    end
    false
  end

  def my_none?(block = false)
    if block
      my_each { |x| return false if block == x }
    elsif !block_given?
      my_each { |x| return false if x }
    else
      my_each { |x| return false if yield(x) }
    end
    true
  end

  def my_count(block = false)
    counter = 0
    if block
      my_each { |x| counter += 1 if block == x }
    elsif block_given?
      my_each { |x| counter += 1 if yield(x) }
    else
      counter = size
    end
    counter
  end

  def my_map(&prc)
    my_new_array = []
    if prc
      my_each { |x| my_new_array << prc.call(x) } if block_given?
    else
      return to_enum(:my_map) unless block_given?
    end
    my_new_array
  end

  def my_inject(number = false)
    counter = 1
    total = self[0]
    res = 0
    res *= number if number

    while counter < size
      res = yield(total, self[counter])
      total = res
      counter += 1
    end
    res
  end

  def multiply_els
    multi = 1
    my_each do |number|
      multi = yield(multi, number)
    end
    multi
  end
end
