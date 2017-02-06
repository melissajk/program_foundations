## Methods, More Methods and Sorting

## Exercise 1 ## 

# [1, 2, 3].select do |num|
#   num > 5      # falsey value
#   'hi'         # truthey value
# end

# => [1,2,3]  # The entire array is returned because 'hi' is a truthey value

## Exercise 2 ##

# If there is a block, then it counts the number of elements that return a 'true'
# value.  In this case, it would return # => 2

## Exercise 3 ## 

#  The return value of #reject are all items that are falsey.  So, because there
# is a 'puts' statement, and puts returns nil, all of the elements are falsey.  
# Therefore this #reject statement returns the array [1,2,3]. 

## Exercise 4 ##

# ['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
#   hash[value[0]] = value
# end

# # => {'a': 'ant', 'b': 'bear' 'c': 'cat'} 
# This code returns a hash even though it is an 'each' method because an object 
# (hash) was passed in with another argument. 


## Exercise 5 ##

# hash = { a: 'ant', b: 'bear' }
# hash.shift

# As per the documentation, the #shift method will remove the first key,value pair from
# hash and return it as an array. 

## Exercise 6 ##

# ['ant', 'bear', 'caterpillar'].pop.size

# This chain of methods returns 11 because the return value of array.pop is 
# 'caterpillar' and the length of caterpillar is 11 characters. 

## Exercise 7 ## 

# [1, 2, 3].any? do |num|
#   puts num
#   num.odd?
# end

# The block's return value is 'true' and it is determined by the last expression in 
# the block...which is num.odd? -- this can only return a true or false. 

## Exercise 8 ##

# array#take(num) takes the first num of elements from the array and returns a 
# new array with the taken elements.  The document doesn't specify whether it's 
# destructive or not, but a simple test in irb shows that it is NOT destructive. 

## Exercise 9 ##

# The return value of map is an array containing the values that have a size > 3,
# but if the conditions for the if statement is not met, it returns a 'nil', so 
# this returns an array of [nil,'bear']

## Exercise 10 ##

# [1, 2, 3].map do |num|
#   if num > 1
#     puts num
#   else
#     num
#   end
# end

# The return value for map is [1,nil,nil] because the first element in the array
# evaluates to false, and num is returned, but the second two evaluate to true 
# and the 'puts' statement will return a nil in both cases. 

## Exercise 11 ##

# arr = ['10', '11', '9', '7', '8']

# arr = arr.each_with_object([]) do |string,array|
#   array << string.to_i
# end

# arr.sort!.reverse!

# arr = arr.each_with_object([]) do |num,array|
#   array << num.to_s
# end

# p arr

# LS solution

# arr.sort do |a,b|
#   b.to_i <=> a.to_i
# end

# This solution RETURNS the required array, but if you ask to print 'arr', you 
# will get the array in the original order.  My solution has been fully mutated
# ...but that's not what they wanted, was it?


## Exercise 12 

# books = [
#   {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
#   {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
#   {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
#   {title: 'Ulysees', author: 'James Joyce', published: '1922'}
# ]

# books.sort_by do |hash|
#   hash[:published]  # We don't have to convert the years to integers because the
# end                  # strings can be compared as well. 

