hash = {}
sort_number = 0
for letter in "a".."z"
  sort_number += 1
  hash[letter.to_sym] = sort_number.to_i
end

puts hash


