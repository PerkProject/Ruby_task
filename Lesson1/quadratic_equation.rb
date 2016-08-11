print "Введите 3 коэффициента: "
a = gets.chomp.to_f
b = gets.chomp.to_f
c = gets.chomp.to_f
d = b ** 2 - 4 * a * c

if d > 0 
	puts "Дискриминант: #{d}"
	x1 = (-b + Math.sqrt(d)) / a * 2
	puts "Первый корень: #{x1}"
	x2 = (-b - Math.sqrt(d)) / a * 2
	puts "Второй корень: #{x2}"
elsif d == 0
 	puts "Дискриминант: #{d}"
	x1 = (-b + Math.sqrt(d)) / a * 2
	puts "Первый корень: #{x1}"
elsif d < 0 
    puts "Дискриминант: #{d}"
    puts "Корней нет "	
end     