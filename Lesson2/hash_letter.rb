alfabet = ("a".."z")
vowels = ["a", "e", "i", "o", "u", "y"]
vowels_index = {}
sort_number = 0
alfabet.each_with_index do |letter, index|
  vowels_index[letter] = index + 1 if vowels.include?(letter)
end

puts vowels_index


