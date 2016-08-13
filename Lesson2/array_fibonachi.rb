array = []
a = 0
b = 1
puts a, b
for i in 2..100 + 1
  c = a + b
  a, b = b, c
  if c <= 100
    array.push(c)
  end
end

puts array
