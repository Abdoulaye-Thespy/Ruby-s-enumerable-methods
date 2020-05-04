module enumerable 
  def my_each
  	return to_enum :my_each unless block_given?
  	for i in self
  		yield(i)
  	end
end

  def my_each_with_index
  	return to_enum :my_each unless block_given?
  	i=0
  	for element in self
  		yield(element, i)
  		i+=1
    end
end









puts "**********************************************************************************************************"

myarray=[20,30,40,5]
myarray.my_each