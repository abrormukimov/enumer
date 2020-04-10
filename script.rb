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
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
  end
  def my_all
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
  end
  def my_any
    for j in 0...self.size
      yield(self[j])
    end
  end
  def my_count
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
  end
  def my_map
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
  end
end

include Enumerable
[1, 2, 3, 4, 5].my_each { |x| p x }
puts "-----------"
[1, 2, 3, 4, 5].my_each_with_index { |x, y| puts "#{x} with index #{y}" }
puts "-----------"
[1, 2, 3, 4, 5].my_select { |x| puts x % 2 == 0 }
puts "-----------"
[1, 2, 3, 4, 5].my_all { |x| puts x > 3 }
puts "-----------"
[1, 2, 3, 4, 5].my_any { |x| puts x % 3 == 0 }
puts "-----------"
[1, 2, 3, 4, 5].my_count { |x| puts x % 2 == 0 }
puts "-----------"
[1, 2, 3, 4, 5].my_map { |x| puts x * 2 }
puts "-----------"
