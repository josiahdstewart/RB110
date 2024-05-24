# Problem: input: array of names output: hash where naems are keys and values are position in array
# Ex: hsh["Fred"] == 0
# Hash
# Algo: create hash
#     : obtain index for each name
#     : store names as keys and index as value

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
hsh = {}
flintstones.each_with_index do |name, i|
  hsh[name] = i
end

p hsh
