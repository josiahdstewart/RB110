# Problem: input: string output: hash with letter frequencey; letter key, freq value
# Explicit: each letter shoudl be a key with integer value
# Implicit: case sensitive

#Dat structure: hash
#Algorhythm: create hash
#           : convert string to array
#          : iterate through array
#           : if letter not in hash, add with value 1
#           : if in hash already, add 1, return

statement = "The Flintstones Rock"
statement_hash = {}

statement.chars.each do |char|
  if statement_hash.key?(char)
    statement_hash[char] += 1
  else
    statement_hash[char] = 1
  end
end

p statement_hash
p statement_hash["R"] == 1
p statement_hash["o"] == 2
