flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each_with_index do |name, i|
  if name.start_with?("Be")
    p i
    break
  end
end

