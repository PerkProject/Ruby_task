class CargoCarriage < Carriage
attr_reader :type

def initialize(carriage_number)
  super
  @type = "cargo"
end

end
