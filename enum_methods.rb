module Enumerable
  def my_each
    return to_enum: my_each unless block_given?

    each do |i|
      yield(i)
    end
  end

  def my_each_with_index
    return to_enum: my_each_with_index unless block_given?

    i = 0
    each do |element|
      yield(element, i)
      i += 1
    end
  end

  def my_select
    return to_enum: my_select unless block_given?

    new_arr = []
    l = length
    l.times do |i|
      new_arr << self[i] if yield(self[i])
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

      my_each { |ind| return false if ind == false || ind.nil? }
      return true
    end

    my_each do |i|
      t_f = yield(i)
      return false if t_f
    end
    true
  end

  def my_count(arg = nil)
    return self unless block_given?

    count = 0
    l = length

    unless arg.nil?
      if arg.is_a?(Regexp)
        my_each { |ind| count += 1 if ind.match(arg) }

      end
    end
    return l unless block_given

    l.times do |i|
      count += 1 if yield(self[i])
    end
    count
  end

  def my_map(arg = nil)
    new_arr = []
    my_each { |num| arr << arg.call(num) } if arg.is_a?(Proc)
    return to_enum: my_each_map unless block_given?

    my_each do |i|
      new_arr << yield(i)
    end
  end

  def my_inject(base = nil)
    return to_enum: my_inject unless block_given?

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

  puts '**********************************************************************************************************'

  myarray = [20, 30, 40, 5, 400, 401, 22, 25, 53, 10, 12, 12, 454_545]
  myhash = { '1' => 'January', '2' => 'February' }
  myarray.my_each
  myhash.my_each
  myarray.my_each_with_index
  myarray.my_select
  myhash.my_select
  myarray.my_all?
  myarray.my_any?
  myarray.my_none?
  myarray.my_count
  myarray.my_map
  myarray.my_inject
end
