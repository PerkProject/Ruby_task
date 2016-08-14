array = [0,1]

while true do
  array.push(array[-1] + array[-2])
  break if array[-1] + array[-2] >= 100
end
puts array
