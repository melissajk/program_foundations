## Selection and Transformation

## Round 1 ##

# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }


# def select_fruit(hash)
#   counter = 0
#   produce_keys = hash.keys
#   selected_fruits = {}
#   loop do
#     break if counter == produce_keys.size
  
#     current_key = produce_keys[counter]
    
#     if hash[current_key] == 'Fruit'
#       selected_fruits[current_key] = 'Fruit'
#     end
    
#     counter += 1
#   end
  
#   selected_fruits
# end
      
# puts select_fruit(produce)
# puts produce


## Round 2 ##

# def double_numbers!(numbers)
#   counter = 0

#   loop do
#     break if counter == numbers.size
#     numbers[counter] = numbers[counter] * 2
#     counter += 1
#   end
#   numbers
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# puts double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]
# puts my_numbers


## Round 3 ##

# def double_odd_index_numbers(numbers)
#   doubled_numbers = []
#   counter = 0

#   loop do
#     break if counter == numbers.size

#     current_number = numbers[counter]
#     current_number *= 2 if counter.odd?
#     doubled_numbers << current_number

#     counter += 1
#   end

#   doubled_numbers
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# puts double_odd_index_numbers(my_numbers)  # => [2, 4, 6, 14, 2, 6]
# puts my_numbers


## Round 4 ##

def multiply(numbers,multiplier)
  result = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    result << current_number * multiplier

    counter += 1
  end

  result
end

my_numbers = [1, 4, 3, 7, 2, 6]
puts multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]

