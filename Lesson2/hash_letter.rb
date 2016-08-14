alfabet = ("a".."z").to_a
vowels = ["a", "e", "i", "o", "u", "y"]
vowels_index = {}
sort_number = 0
alfabet.each do |letter|
  sort_number += 1
  vowels_index[letter] = sort_number if vowels.include?(letter)
end

puts vowels_index


