#Создать модуль InstanceCounter, содержащий следующие методы класса и инстанс-методы, которые подключаются автоматически при вызове include в классе:
#Методы класса:
#       - instances, который возвращает кол-во экземпляров данного класса
#Инастанс-методы:
#       - register_instance, который увеличивает счетчик кол-ва экземпляров класса и который можно вызвать из конструктора. При этом данный метод не должен быть публичным.
module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end
end

module ClassMethods
  @@instances = 0

  def initialize
    @@instances += 1
  end
  def self.instansec
    @@instances
  end
end

module InstanceMethods
  protected
  def register_instance
    @@instances +=1
  end
  def initialize
    puts @@instasec
  end
end