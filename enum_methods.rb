module enumerable 
	class Array
  def my_each
  	return to_enum :my_each unless block_given?
  	for i in self
  		yield(i)
  	end
  end
end










puts "**********************************************************************************************************"

myarray=[20,30,40,5]
myarray.my_each
