## Exercise 1 ##

# (1..10).each {|num| puts 'The Flintstones Rock'.rjust(num + 'The Flintstones Rock'.size)}

# LS solution 10.times { |number| puts (" " * number) + "The Flintstones Rock!" }


## Exercise 2 ##

# puts "the value of 40 + 2 is " + (40 + 2)

# You will get an error because you can't concatenate a numeric value with a string.

# fix 1
# puts "the value of 40 + 2 is #{(40 + 2)}"

# fix 2 
# puts "the value of 40 + 2 is " + (40 + 2).to_s

## Exercise 3 ##

# def factors(number)
#   dividend = number
#   divisors = []
#   while dividend > 0
#     divisors << number / dividend if number % dividend == 0
#     dividend -= 1
#   end
#   divisors
# end

# Bonus 1 -- The purpose of 'number % dividend == 0' is to check to see if one 
# of the dividend candidates can divide into the number and leave a remainder 
# of 0.  

# Bonus 2 -- The purpose of the 'divisors' just before the second end is to 
# return the array-ful of dividends. 

## Exercise 4 ##

# def rolling_buffer1(buffer, max_buffer_size, new_element)
#   buffer << new_element
#   buffer.shift if buffer.size >= max_buffer_size
#   buffer
# end

# def rolling_buffer2(input_array, max_buffer_size, new_element)
#   buffer = input_array + [new_element]
#   buffer.shift if buffer.size >= max_buffer_size
#   buffer
# end

# They are different. The method 'rolling_buffer1' modifies the array that was 
# put into the method...which is a big fat no-no.  The method called
# 'rolling_buffer2' doesn't modify the array. 

## Question 5 ##

# The 'limit' variable is outside the scope of the 'fib' method.  You either 
# have to put the variable inside the method, or pass in the value as an 
# argument.

## Question 6 ##

# def tricky_method(a_string_param, an_array_param)
#   a_string_param += "rutabaga"
#   an_array_param += ["rutabaga"]
#   return a_string_param, an_array_param
# end

# my_string = "pumpkins"
# my_array = ["pumpkins"]
# my_string, my_array = tricky_method(my_string, my_array)

# puts "My string looks like this now: #{my_string}"
# puts "My array looks like this now: #{my_array}"

# This was a 'tricky' problem because I wasn't sure what the program was trying
# to accomplish.  The programmer was trying to re-use all of their variables, 
# instead of re-naming them so that one could follow their logic. 

## Question 7 ##

# The code outputs '34' because the method does mess with the number, but the
# puts statement uses the original value of the variable (42). 42 - 8 = 34

## Question 8 ##

# Yes, the family's information was ransacked because the hash that was passed 
# into the method was not reassigned to another object id, so the 'munsters' 
# hash was mutated. 

## Question 9 ## 

# The result of the call is 'paper'.  If you start with the innermost arguments,
# then paper beats rock and rock beats scissors, then, again paper beats rock 
# and one last time as you reach  the outermost arguments for this method. 

## Question 10 ##

# This will return 'no'.  The 'bar' method will return 'yes' if there is no 
# argument and the parameter defaults to 'no'.  But there is a parameter!  'foo'!

