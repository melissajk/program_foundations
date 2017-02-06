## Exercise 1 

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# p ages.include?("Spot")
# p ages.has_key?("Spot")
# p ages.member?("Spot")

## Exercise 2

# munsters_description = "The Munsters are creepy in a good way."

# puts munsters_description.capitalize!
# puts munsters_description.swapcase!
# puts munsters_description.downcase!
# puts munsters_description.upcase!

## Exercise 3

# ages = { "Herman" => 32, 
#           "Lily" => 30,
#           "Grandpa" => 5843,
#           "Eddie" => 10 
# }

# additional_ages = { "Marilyn" => 22, "Spot" => 237 }

# puts ages.merge!(additional_ages)

## Exercise 4

# advice = "Few things in life are as important as house training your pet dinosaur."

# puts advice.include?('Dino')  --> This was my solution, and it worked, but...

# puts advice.match("Dino") ---> This was LS's solution, but #match method is for
# regex -- what's up with that?

## Exercise 5 

# flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
# flintstones = %w(Fred, Barney, Wilma, Betty, BamBam, Pebbles)

## Exercise 6 

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# flintstones << 'Dino'

## Exercise 7

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# flintstones.push('Dino').push('Hoppy')
# flintstones.concat(%w(Dino, Hoppy))

## Exercise 8 

# advice = "Few things in life are as important as house training your pet dinosaur."

# puts advice.slice!("Few things in life are as important as ") # --> my solution

# puts advice.slice!(0, advice.index('house')) # ---> LS solution

# If you just use the string#slice, then the advice variable will still contain
# the entire string. 

## Exercise 9 

# statement = "The Flintstones Rock!"
# puts statement.count('t') --> My solution

# puts statement.scan('t').count ---> LS solution 

## Exercise 10

# title = "Flintstone Family Members"
# puts title.center(40)

