def titleize(str)
  words = str.split
  words.each {|word| word.capitalize!}
  words.join(' ')
end
words = "the flintstones rock"
p titleize(words) == "The Flintstones Rock"

