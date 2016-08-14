array = [0,1]

while array[-1] + array[-2] <= 100 do
  array << (array[-1] + array[-2])
end
puts array
