module Enumerable
  def my_each
    return self unless block_given?
  	for i in self
  		yield(i)
  	end

  end

  def my_each_with_index
  	return self unless block_given?
  	i=0
  	for element in self
  		yield(element, i)
  		i+=1
    end
  end


  def my_select
    return self unless block_given?
    new_arr=[]
    l=self.length
    l.times do |i|
        new_arr << self[i] if yield(self[i])
        i += 1
    end
      new_arr
  end

  def my_all?
    return true unless block_given?
    for i in self
      t_f= yield(i)
      print t_f
      return false unless t_f
    end
    return true
  end

  def my_any?
    return true unless block_given?
    for i in self
      t_f=yield(i)
      return true if t_f
    end
  return false
  end

  def my_none?
    return true unless block_given?
    for i in self
      t_f=yield(i)
      return false if t_f
    end
  return true
  end

  def my_count
    return self unless block_given?
    count=0
    l=self.length
    l.times do |i|
        count+=1 if yield(self[i])
         i += 1
    end
      count
  end



puts "**********************************************************************************************************"

myarray=[20,30,40,5,400,401,22,25,53, 10, 12, 12, 454545]
myhash={"1" => "January", "2" => "February"}
myarray.my_each 
myhash.my_each
myarray.my_each_with_index
r=myarray.my_select
myhash.my_select
res=myarray.my_all?
myarray.my_any?
myarray.my_none?
r=myarray.my_count
end