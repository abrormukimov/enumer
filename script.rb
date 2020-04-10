module Enumerable
  def my_each
    i = 0
    while i < self.size
      yield(self[i])
      i += 1
    end
  end

  def my_each_with_index
    for j in 0...self.size
      yield(self[j], j)
    end
  end

  def my_select
    my_array = []
    my_each do |element|
      my_array << element if yield(element)
    end
    my_array
  end

  def my_all?
    my_all_array = []
    my_each do |numbers|
      my_all_array << numbers if yield(numbers)
    end
    my_all_array
  end

  def my_any?
    my_each { |x| return true if yield(x) }
    false
  end

  def my_none?
    my_each do |number|
      return false if yield(number)
    end
    true
  end

  def my_count
    counter = 0
    my_each { |x| counter += 1 if yield(x) }
    counter
  end

  def my_map(&prc)
    my_array_map = []
    my_each do |el|
      return my_array_map << prc.call(el) if block_given?
      end
    end
    my_array_map
  end

  def my_inject
    counter = 0
    my_each do |number|
      counter = yield(counter, number)
    end
    counter
  end

  def multiply_els
    multi = 1
    my_each do |number|
      multi = yield(multi, number)
    end
    multi
  end
end

# [1, 2, 3, 4, 5].my_each { |x| p x }
# puts "-----------"
# [1, 2, 3, 4, 5].my_each_with_index { |x, y| puts "#{x} with index #{y}" }
# puts "-----------"
# print [1, 2, 3, 4, 5].my_select { |x| x % 2 == 0 }
# puts
# puts "-----------"
# print [1, 2, 3, 4, 5].my_all? { |x| x % 3 == 0 }
# puts
# puts "-----------"
# print [1, 2, 2, 2, 5].my_any? { |x| x > 3 }
# puts
# puts "-----------"
# print [1, 2, 2, 1, 2].my_none? { |x| x > 3 }
# puts
# puts "-----------"
# print [1, 12, 13, 14, 3].my_count { |x| x < 10 }
# puts
# puts "-----------"
# [1, 2, 3, 4, 5].my_map { |x| puts x * 2 }
# puts "-----------"
# print [1, 2, 3, 4, 5, 6, 7].my_inject { |accum, num| accum + num }
# puts
# puts "-----------"
# print [1, 2, 3, 5, 7].multiply_els { |accum, num| accum * num }
# puts
# puts "-----------"