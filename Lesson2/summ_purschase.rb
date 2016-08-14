purschase = {}
order_price = 0.0
loop do
print "Введите название товара "
product = gets.chomp
break if product == "стоп" || product == "stop"
print "Введите цену за единицу товара "
price = gets.chomp.to_f
print "Введите количество товара "
qty = gets.chomp.to_f
purschase[product] = {price: price, qty: qty, total_price: price * qty}
puts purschase
end

purschase.each_value do |options_name|
 order_price += options_name[:total_price]
end

puts "Общая стоимость всех покупок в корзине: #{order_price}"


