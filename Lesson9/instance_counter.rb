module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end
end

module ClassMethods
  attr_accessor :instances
end

module InstanceMethods
  protected

  def register_instance
    calss.instances ||= 0
    self.class.instances += 1
  end
end
