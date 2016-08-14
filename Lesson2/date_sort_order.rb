print "Введите число, месяц, год "
number = gets.chomp.to_i
month = gets.chomp.to_i - 1
year = gets.chomp.to_i
is_leap_year = true if year % 4 == 0 && year % 100 != 0 || year % 400 == 0
days_in_month = [31,28,31,30,31,30,31,31,30,31,30,31]
days_in_month[1] = 29 if is_leap_year == true
order_days = 0

for order_month in 1..month
  order_month -= 1
  order_days += days_in_month[order_month]
end

puts "Порядковый номер даты: #{order_days += number}"

