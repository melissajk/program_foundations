## Exercise 1 ##

# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# flintstones_hash = {}
# flintstones.each_with_index do |name, i|
#   flintstones_hash[name] = i
# end

# p flintstones_hash


## Exercise 2 ##

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# ages.values.inject do |memo, age|    # => This can also be written: ages.values.inject(:+)
#   memo + age
# end

# => 6174

## Exercise 3 ##

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# ages.reject do |name, age|
#   age > 100
# end

# => {"Herman"=>32, "Lily"=>30, "Eddie"=>10} 

# You can also use:
# ages.keep_if { |_, age| age < 100 }  <=== This is DESTRUCTIVE!

## Exercise 4 ##

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# min_age = ages.values.min

# puts min_age # => 10


## Exercise 5 ##

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# flintstones.index { |name| name[0,2] == 'Be'}

# ** Need to remember that you can offer a range for indices (e.g. name[0,2])

## Exercise 6 ##

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# flintstones.map! { |name| name[0,3] }

# p flintstones


## Exercise 7 ##

# statement = "The Flintstones Rock"

# freq_hash = {}
# statement.delete(' ').each_char do |char|
#   freq_hash[char] = statement.count(char)
# end

# p freq_hash

## Exercise 8 ##

# The first code outputs  1 and 3 because with each iteration, the array is losing 
# an element on the front end.  When the code starts at the second element, it's essentially
# jumping ahead to the third.  Finally the array gets so short that the code exits the 
# loop.  

# The second code outputs 1 and 2 because while the first two elements are printed, the 
# last two are popped off by the array#pop method.  The #each method finishes after the second 
# iteration. 

## Exercise 9 ##

# words = "the flintstones rock"
# title_array = words.split

# title_array.map! do |word|
#   word.capitalize
# end

# words = title_array.join(' ')

# puts words

# LS solution ==> the same, but more streamlined..
# words.split.map { |word| word.capitalize }.join(' ')

## Exercise 10 ##

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# munsters.map do |_, value|
#   case value["age"]
#     when (0..17)
#       value["age_group"] = "kid"
#     when (18..64)
#       value["age_group"] = "adult"
#     else
#       value["age_group"] = "senior"
#   end
# end

# puts munsters

# I could have done the same thing with hash#each because the items are being 
# added to the hash which would have modified it... even with an 'each' method

## Exercise 11 ##

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" }
# }

# total_male_age = 0
# munsters.each do |_, value|
#   if value["gender"] == "male"
#     total_male_age += value["age"]
#   end
# end

# p total_male_age


## Exercise 12 ##

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# munsters.each do |name, details|
#   puts "#{name} is a #{details["age"]} year old #{details["gender"]}."
# end

## Exercise 13 ##

# def new_uuid
#   characters = [0,1,2,3,4,5,6,7,8,9,'a','b','c','d','e','f']
#   uuid_array = []
#   counter = 0
#   while counter < 32
#     uuid_array << characters.sample
#     counter += 1
#   end
#   uuid_array[0..7].join + '-' + uuid_array[8..11].join + '-' + uuid_array[12..15].join + '-' \
#   + uuid_array[16..19].join + '-' + uuid_array[20..32].join 
# end

# puts new_uuid

  
  