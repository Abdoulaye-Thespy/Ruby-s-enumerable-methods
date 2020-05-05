module Enumerable 
  def my_each
  	return to_enum :my_each unless block_given?
  	for i in self
  		yield(i)
  	end
  end

  def my_each_with_index
  	return to_enum :my_each_with_index unless block_given?
  	i=0
  	for element in self
  		yield(element, i)
  		i+=1
    end
  end


  def my_select
    return to_enum :my_select unless block_given?
    new_arr=[]
    for i in self
         if yield(i) == true
         new_arr << i
       end
    end
     p new_arr
  end

  def my_all
    return true unless block_given?
    
  end

end




puts "**********************************************************************************************************"

myarray=[20,30,40,5,400,401,22,25,53]
myarray.my_each
myarray.my_each_with_index
myarray.my_select