# Problem: input: hash with name keys and age values output: integer value sum of ages
# Examples: output shoudld be 6174
# Data structure: integer output, convert hash to array
# algo: convert values to arrays
# 		sum values in array

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
p ages.values.sum

#Problem: input: ages hash output: ages hash - people > 100 no new object
#Examples: grandpa should be gone
# Data structure: hash, select to array, convert back to hash
# ALGO: remove 

ages_two = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages_two.select! do |_, ages|
  ages < 100
end
p ages_two

#Problem input: hash output: minimum integer
# Example output should be 10
# Data structure: integer
# Algo: iterate through hash
#     : pick smallest
#         create int var
#         store first value in var
#         if next value < var reassign
#         return value

ages_three = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
minimum_age = ages_three.values[0]
ages_three.each do |_, ages|
  minimum_age = ages if ages < minimum_age
end
p minimum_age
