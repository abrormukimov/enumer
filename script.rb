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
      my_each { |x| return false unless block === x }
    elsif !block_given?
      my_each { |x| return false unless x }
    else
      my_each { |x| return false unless yield(x) }
    end
    true
  end

  def my_any?(block = false)
    if block
      my_each { |x| return true if block === x }
    elsif !block_given?
      my_each { |x| return true if x }
    else
      my_each { |x| return true if yield(x) }
    end
    false
  end

  def my_none?(block = false)
    if block
      my_each { |x| return false if block === x }
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
      my_each { |x| counter += 1 if block === x }
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

  def my_inject(first = nil, second = nil)
    array = is_a?(Array) ? self : to_a
    symbol = first if first.is_a?(Symbol) || first.is_a?(String)
    accum = first if first.is_a? Integer

    if first.is_a?(Integer)
      symbol = second if second.is_a?(Symbol) || second.is_a?(String)
    end

    if symbol
      array.my_each { |x| accum = accum ? accum.send(symbol, x) : x }
    elsif block_given?
      array.my_each { |x| accum = accum ? yield(accum, x) : x }
    end
    accum
  end

  def multiply_els
    multi = 1
    my_each do |number|
      multi = yield(multi, number)
    end
    multi
  end
end
