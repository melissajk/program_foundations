## Exercise 1 

# numbers = [1, 2, 2, 3]
# numbers.uniq

# puts numbers

# 1
# 2
# 2 (uniq is a non-destructive method)
# 3 

## Exercise 2

# 1 '!=' means 'not equal to'.  You use it in a Boolean Statement
# 2  '!' means 'not' (which turns an object into its Boolean opposite)
# 3 'words.uniq!' will mutate the caller
# 4 '?' before something is for a ternary operator ( conditional ? yes : no )
# 5 '?' can be a part of a method name, either a created method or otherwise
# 6 '!!' means 'not,not' (which turns an object into its Boolean equivalent)

## Exercise 3

# advice = "Few things in life are as important as house training your pet dinosaur."

# puts advice.gsub('important','urgent')

## Exercise 4

# numbers = [1, 2, 3, 4, 5]

# numbers.delete(1) -- deletes '1' from the array
# numbers.delete_at(1) -- deletes the object at index 1 (which is 2)

## Exercise 5 

#  (1..100).include?(42)  OR!!!  (1..100).cover?(42)

## Exercise 6

# famous_words = "seven years ago..."

# gsburg_address = "Four score and"

# puts gsburg_address + ' ' + famous_words

# puts "#{gsburg_address} #{famous_words}"

# "Four score and " + famous_words

# famous_words.prepend("Four score and ")

# "Four score and " << famous_words

## Exercise 7 

# def add_eight(number)
#   number + 8
# end

# number = 2

# how_deep = "number"
# 5.times { how_deep.gsub!("number", "add_eight(number)") }

# p eval(how_deep) = 42

## Exercise 8 

# flintstones = ["Fred", "Wilma"]
# flintstones << ["Barney", "Betty"]
# flintstones << ["BamBam", "Pebbles"]

# p flintstones.flatten!

## Exercise 9 

# flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
# barney = flintstones.to_a[2]   --> my solution

# flintstones.assoc("Barney")  --> LS solution




