class CargoCarriage < Carriage

  def initialize(carriage_number)
    super
    @type = :cargo
  end

end
