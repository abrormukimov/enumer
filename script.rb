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
end

include Enumerable
[1, 2, 3, 4, 5].my_each { |x| p x }
[1, 2, 3, 4, 5].my_each_with_index { |x, y| puts "#{x} with index #{y}" }
[1, 2, 3, 4, 5].my_select { |x| puts x % 2 == 0 }