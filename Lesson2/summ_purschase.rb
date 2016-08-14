purschase = {}
while true do
order_price = 0.0
print "Введите название товара "
product = gets.chomp.to_s
break if product == "стоп" || product == "stop"
print "Введите цену за единицу товара "
price = gets.chomp.to_f
print "Введите количество товара "
qty = gets.chomp.to_f
purschase[product] = {price: price, qty: qty, total_price: price * qty}
puts purschase

purschase.each_value do |options_name|
 options_name.each do |option_name, value|
 order_price += value if option_name.to_s == "total_price"
end
end
puts "Общая стоимость всех покупок в корзине: #{order_price}"
end



