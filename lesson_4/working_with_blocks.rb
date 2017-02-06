## Exercise 1 ##  

# arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

# arr1[2][1][3] # => 'g'

# arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

# arr2[1][:third][0] # => 'g'

# arr3 = [['abc'], ['def'], {third: ['ghi']}]

# arr3[2][:third][0][0] # => 'g'

# hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

# hsh1["b"][1] # => 'g'

# hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

# hsh2[:third].keys[0] # => 'g'

## Exercise 2 ##

# arr1 = [1, [2, 3], 4]

# arr1[1][1] = 4  # => [1, [2, 4], 4]

# arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

# arr2[2] = 4 # => [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 4]

# hsh1 = {first: [1, 2, [3]]}

# hsh1[:first][2][0] = 4 # => {first: [1, 2, [4]]}

# hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

# hsh2[["a"]][:a][2] = 4 # =>  {['a'] => {a: ['1', :two, 4], b: 4}, 'b' => 5}

## Exercise 3 ##

# a = 2
# b = [5,8]
# arr = [a,b]

# arr[0] += 2
# arr[1][0] -= a

# a # => 2         
# b # => [3,8]

# The value of a didn't change because it wasn't referenced.  The first item in
# 'arr' is what was changed. The value of b did change because b is an array 
# and we are modifying that array by assigning a new value at index 0

## Exercise 4 ##

# hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

# hsh.each do |key,value|
#   value.each do |string|
#     string.chars.each do |char|
#       if 'aeiou'.include?(char)
#         puts char
#       end
#     end
#   end
# end

## Exercise 5 ##

# arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# arr.map do |sub_array|
#   sub_array.sort! do |a,b|
#     b <=> a
#   end
# end

# p arr

## Exercise 6 ##

# arr1 = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# arr1.map do |hash|
#   new_hash = {}
#   hash.each do |key,value|
#     new_hash[key] = value + 1
#   end
#   new_hash
# end

# => [{a: 2}, {b: 3, c: 4}, {d: 5, e: 6, f: 7}]

## Exercise 7 ##

# arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

# arr.map do |array|
#   array.reject do |num|
#     num%3 != 0
#   end
# end

# => [[], [3], [9], [15]]

## Exercise 8 ##

# arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

# arr.map do |element|
#   new_hash = {}
#   new_hash[element[0]] = element[1]
#   new_hash
# end

# => [{:a=>1}, {"b"=>"two"}, {"sea"=>{:c=>3}}, {{:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}] 

# This exercise was worded poorly... I thought that they wanted to convert each
# sub-array into a hash, but they really wanted to convert the outer array to a 
# hash with the items in the sub-arrays acting as keys and values. 


# hash = {}
# arr.each do |item|
#   hash[item[0]] = item[1]
# end

# => {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

## Exercise 9 ##

# arr = [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

# arr.sort_by do |element|
#   element.select do |num|
#     num.odd?
#   end
# end

# => [[1, 8, 3], [1, 6, 7], [1, 4, 9]] 

## Exercise 10 ##

# hsh = {
#   'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
#   'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
#   'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
#   'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
#   'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
# }

# hsh.map do |_,value|
#   if value[:type] == 'fruit'
#     value[:colors].map do |string|
#       string.capitalize
#     end
#   elsif
#     value[:type] == 'vegetable'
#     value[:size].upcase
#   end
# end

# => [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"] 


## Exercise 11 ##

# arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# arr.select do |hash|
#   hash.all?  do |_,value|
#     value.all? do |num|
#       num.even?
#     end
#   end
# end

# => [{:e=>[8], :f=>[6, 10]}] 

# arr = [['stars', 'river'], 'letter', ['leaves', ['horses', 'table']]]

# arr.each_with_object([]) do |item, new_array|
#   if item.length >= 5
#     new_array << item
#   else
#     item.each do |item2|
#       if item2.length >= 5
#         new_array << item2
#       else 
#         item2.each do |item3|
#           new_array << item_3
#         end
#       end
#     end
#   end
# end

# => ["stars", "river", "letter", "leaves", "horses", "table"]



