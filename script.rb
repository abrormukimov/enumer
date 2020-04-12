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

    for j in 0...self.size
      yield(self[j], j)
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
    case
    when block
      my_each { |x| return false unless block === x }
    when !block_given?
      my_each { |x| return false unless x }
    else
      my_each { |x| return false unless yield(x) }
    end
    true
  end

  def my_any?(block = false)
    case
    when block
      my_each { |x| return true if block === x }
    when !block_given?
      my_each { |x| return true if x }
    else
      my_each { |x| return true if yield(x) }
    end
    false
  end

  def my_none?(block = false)
    case
    when block
      my_each { |x| return false if block === x }
    when !block_given?
      my_each { |x| return false if x }
    else
      my_each { |x| return false if yield(x) }
    end
    true
  end

  def my_count(block = false)
    counter = 0
    case
    when block
      my_each { |x| counter += 1 if block === x }
    when block_given?
      my_each { |x| counter += 1 if yield(x) }
    else
      counter = self.size
    end
    counter
  end

  def my_map(&prc)
    my_new_array = []
    if prc
      my_each { |x| my_new_array << prc.call(x)} if block_given?
    else
      return to_enum(:my_map) unless block_given?
    end
    my_new_array
  end

  def my_inject(number = nil)
    counter = 1
    total = self[0]
    res = 0
    res *= number if number

    while counter < self.size
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

include Enumerable
p [1, 2, 3, 4, 5].my_each
puts "-----------"
p [1, 2, 3, 4, 5].my_each_with_index
puts "-----------"
p [1, 2, 3, 4, 5].my_select
puts
puts "-----------"
p ["ass", "ss", "fish"].my_all?(/g/)
puts
puts "-----------"
print ["dish", "fish", 3].my_any?(Integer)
puts
puts "-----------"
print ["dish", "dosh", "qosh"].my_none?(/c/)
puts
puts "-----------"
print [1, 12, 13, 14, 3].my_count
puts
puts "-----------"
p [1, 2, 3, 4, 6].my_map { |x| x < 6 }
puts "-----------"
p [2, 3, 4].my_inject { |accum, num| accum * num }
puts
puts "-----------"
print [1, 2, 3, 5, 7].multiply_els { |accum, num| accum * num }
puts
puts "-----------"