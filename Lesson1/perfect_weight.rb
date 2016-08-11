print "Как тебя зовут? "
name = gets.chomp.to_s.capitalize!
print "Укажи свой рост "
perfect_weight = gets.chomp.to_i - 110

  if perfect_weight >= 0
  		puts "Привет #{name} , твой идеальный вес #{perfect_weight}"
  	else
  		puts "Ваш вес уже оптимальный"
  end 	
   		

