## Exercise 1 ##

# I was unable to predict the behavior of the change in object id's. I knew that
# reassigning the values would change the object id, but I also thought that they
# would vary inside and outside of the block. I also could not predict that the
# id's would be the same for the same value (even though they had different variables.)
# 
#  Remember:
# * Ruby will reuse object id's when the value is the same (even if the variable is different)
# * Ruby will NOT change the id for any of the objects between the outside and inside block
# * Changing the values will force Ruby to change the id's.  Changing variable names won't.

## Exercise 2 ##

# The big difference in this problem was that the object id's were the same 
# before and after the method call.  They were manipulated inside of the method, but
# they remained unchanged at the end.  The main method has no access to variables that
# are defined inside of the method.  

## Exercise 3 ##

# def tricky_method_two(a_string_param, an_array_param)
#   a_string_param << 'rutabaga'
#   an_array_param = ['pumpkins', 'rutabaga']
# end

# my_string = "pumpkins"
# my_array = ["pumpkins"]
# tricky_method_two(my_string, my_array)

# puts "My string looks like this now: #{my_string}"
# puts "My array looks like this now: #{my_array}"

# a_string_param was modified inside of the method, while tricky_method_two
# attempted to redefine the value that was passed to it....it didn't work. 

## Question 5 ##

# def color_valid(color)
#   if color == "blue" || color == "green"
#     true
#   else
#     false
#   end
# end

# # This is the same as...

# def color_valid(color)
#   color == "blue" || color == "green"
# end

# The 'if' statement is redundant



