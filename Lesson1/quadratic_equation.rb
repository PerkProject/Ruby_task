print "Введите 3 коэффициента: "
a = gets.chomp.to_f
a = 0.0 if a.nil? == true  || a.nan? == true
b = gets.chomp.to_f
b = 0.0 if b.nil? == true  || b.nan? == true
c = gets.chomp.to_f
c = 0.0 if c.nil? == true  || c.nan? == true
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
else
    puts "Дискриминант: #{d}"
    puts "Корней нет "
end
