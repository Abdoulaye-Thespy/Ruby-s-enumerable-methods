module Enumerable
  def my_each
    return self unless block_given?

    each do |i|
      yield(i)
    end
  end

  def my_each_with_index
    return self unless block_given?

    i = 0
    each do |element|
      yield(element, i)
      i += 1
    end
  end

  def my_select
    return self unless block_given?

    new_arr = []
    l = length
    l.times do |i|
      new_arr << self[i] if yield(self[i])
      i += 1
    end
    new_arr
  end

  def my_all?
    return true unless block_given?

    each do |i|
      t_f = yield(i)
      print t_f
      return false unless t_f
    end
    true
  end

  def my_any?
    return true unless block_given?

    each do |i|
      t_f = yield(i)
      return true if t_f
    end
    false
  end

  def my_none?
    return true unless block_given?

    each do |i|
      t_f = yield(i)
      return false if t_f
    end
    true
  end

  def my_count
    return self unless block_given?

    count = 0
    l = length
    l.times do |i|
      count += 1 if yield(self[i])
      i += 1
    end
    count
  end

  def my_map()
    puts self
    return self unless block_given?

    new_arr = []
    l = length
    l.times do |i|
      new_arr << yield(self[i])
      i += 1
    end

    p new_arr
end

  def my_inject(base)
    return self unless block_given?

    sum = base
    l = length
    l.times do |i|
      sum = yield(sum, self[i])
      i += 1
    end
    sum
end

  def multiply_els(array)
    r = array.my_inject(1) do |x, y|
      x * y
    end
    p r
    r
  end

  puts '**********************************************************************************************************'

  myarray = [20, 30, 40, 5, 400, 401, 22, 25, 53, 10, 12, 12, 454_545]
  myhash = { '1' => 'January', '2' => 'February' }
  myarray.my_each
  myhash.my_each
  myarray.my_each_with_index
  r = myarray.my_select
  myhash.my_select
  myarray.my_all?
  myarray.my_any?
  myarray.my_none?
  myarray.my_count
  myarray.my_map
  myarray.my_inject(0)
  r = myarray.multiply_els([2, 3, 4, 5])
  p r
end
