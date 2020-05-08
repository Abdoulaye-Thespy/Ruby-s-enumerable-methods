module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    each do |i|
      yield(i)
    end
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    i = 0
    my_each do |element|
      yield(element, i)
      i += 1
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    new_arr = []
    my_each do |i|
      new_arr << i if yield(i)
    end
    new_arr
  end

  def my_all?(arg = nil)
    unless arg.nil?
      if arg.is_a?(Regexp)
        my_each { |ind| return false unless ind.match(arg) }
      elsif arg.is_a?(Module)
        my_each { |ind| return false unless ind.is_a?(arg) }
      else
        my_each { |ind| return false if ind != arg }
      end
      return true
    end

    unless block_given?

      my_each { |ind| return false if ind == false || ind.nil? }
      return true
    end

    my_each do |i|
      t_f = yield(i)
      return false unless t_f
    end
    true
  end

  def my_any?(arg = nil)
    unless arg.nil?
      if arg.is_a?(Regexp)
        my_each { |ind| return true if ind.match(arg) }
      elsif arg.is_a?(Module)
        my_each { |ind| return true if ind.is_a?(arg) }
      else
        my_each { |ind| return true if ind == arg }
      end
      return false
    end

    unless block_given?

      my_each { |ind| return true if ind != false && !ind.nil? }
      return false
    end

    my_each do |i|
      t_f = yield(i)
      return true if t_f
    end
    false
  end

  def my_none?(arg = nil)
    unless arg.nil?
      if arg.is_a?(Regexp)
        my_each { |ind| return false if ind.match(arg) }
      elsif arg.is_a?(Module)
        my_each { |ind| return false if ind.is_a?(arg) }
      else
        my_each { |ind| return false if ind == arg }
      end
      return true
    end

    unless block_given?

      my_each { |ind| return false if ind !=false || !ind.nil? }
      return true
    end

    my_each do |i|
      t_f = yield(i)
      return false if t_f
    end
    true
  end

  def my_count(arg = nil)

    count = 0

    unless arg.nil?
      if arg.is_a?(Regexp)
        my_each { |ind| count += 1  if ind.match(arg) }
      elsif arg.is_a?(Numeric)
        my_each {|ind| count +=1 if ind===arg}
          

      end
      return count
    end
    return self.length unless block_given?

    my_each do |i|
      count += 1 if yield(i)
    end
    count
  end

  def my_map(arg = nil)
    new_arr = []
    my_each { |num| arr << arg.call(num) } if arg.is_a?(Proc)
    return to_enum(:my_map) unless block_given?

    my_each do |i|
      new_arr << yield(i)
    end
  end

  def my_inject(base = nil)
    return to_enum(:my_inject) unless block_given?

    sum = base
    l = length
    l.times do |i|
      sum = yield(sum, self[i])
    end
    sum
  end

  def multiply_els(array)
    r = array.my_inject(1) do |x, y|
      x * y
    end
    r
  end
 end
