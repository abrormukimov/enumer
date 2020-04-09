module Enumerable

  def my_each(a, b)

    yield(a, b)

  end


end

puts my_each(5, 6) { |a, b| a + b}

