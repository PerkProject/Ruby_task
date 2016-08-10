print "Как тебя зовут? "
get_name = (gets.chomp.to_s.capitalize!)
print "Укажи свой рост "
get_perfect_weight = Integer(gets.chomp) - 110

  if get_perfect_weight >= 0
  		puts "Привет #{get_name} , твой идеальный вес #{get_perfect_weight}"
  	else
  		puts "Ваш вес уже оптимальный"
  end 	
   		

