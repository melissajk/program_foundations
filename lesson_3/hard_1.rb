## Exercise 1 ##

# if false
#   greeting = “hello world”
# end

# greeting

# Nothing will happen because 'greeting' was initialized inside of an 'if' block
# which causes to return 'nil'

## Exercise 2 ##

# greetings = { a: 'hi' }
# informal_greeting = greetings[:a]
# informal_greeting << ' there'

# puts informal_greeting  #  => "hi there"
# puts greetings # => {:a=> "hi there"}

# {:a=> "hi there"} WOW!  I didn't see that one coming!  This is because
# 'informal_greeting' referenced the hash and then used the '<<' method to add
# 'there' to the string.  This resulted in a change to the original object 'greetings'.
#  If we want to keep the value of greetings, then we can do:
#     informal_greeting = greetings[:a].clone 
# OR  informal_greeting = informal_greeting + 'there' 

## Exercise 3 ##

# A will return "one is: one", "two: is two", "three is: three"
# B the same
# C will return "one is: two", "two: is three", "three is: one"

# All correct!  I rock!

## Exercise 4 ##

# def dot_separated_ip_address?(input_string)
#   dot_separated_words = input_string.split(".") 
#   return false unless dot_separated_words.size == 4
  
#   while dot_separated_words > 0 
#   word = dot_separated_words.pop
#     return false unless is_an_ip_number?(word) # the 'break' statement has been replaced with 
#   end                                          # 'return false unless....'
#   true
# end

# The original 'break' statement will exit the entire loop without returning the 
# needed 'true' value.  The 'return false unless' statement allows the loop to 
# complete. 


