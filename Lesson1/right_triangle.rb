print "Укажите 3 стороны треугольника "
side1 = gets.chomp.to_f
side2 = gets.chomp.to_f
side3 = gets.chomp.to_f

if (side1**2 == side2**2 + side3**2) || (side2**2 == side1**2 + side3**2) || (side3**2 == side2**2 + side1**2)
puts "Треугольник прямоугольный! "
else
puts "Треугольник не прямоугольный! "
end			

if (side1 == side2)|| (side2 == side3) || (side3 == side1)
puts "Треугольник равнобедренный! " 
end
