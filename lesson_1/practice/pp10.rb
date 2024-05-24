# Problem: Input: family hash with sub hash for each name output: hash with addded key of age group
# 	Explicit: every family member shoudl be assigned an age grou
# => 			-0-17 kid, 18-64 adult, senior 65+
# => 			-"age_group" is the key, string value
# =>Implicit: - shoudl be added to subarray
# Test Cases: p munsters["Herman"]["age_group"] == "adult"
# 			  p munsters["Eddie"]["age_group"] == "kid"
# => 		  p munsters["Grandpa"]["age_group"] == "senior"
# Data Structure: hash w/sub-hashes
# Algorithm: 
# 1. create age range variables
# 2. iterate through munsters hash
# 3. check age for each person
# 	a. use age ranges to assign into age_group
#     - use conditional logic to check
# 4. add age_group key with correct group as value

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

kid = (0..17)
adult = (18..64)

munsters.each do |name, info|
	if kid.cover?(info["age"])
		info["age_group"] = "kid"
	elsif adult.cover?(info["age"])
		info["age_group"] = "adult"
	else
		info["age_group"] = "senior"
	end
end

p munsters["Herman"]["age_group"] == "adult"
p munsters["Eddie"]["age_group"] == "kid"
p munsters["Grandpa"]["age_group"] == "senior"
