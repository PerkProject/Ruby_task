class PassengerCarriage < Carriage

  def initialize (carriage_number)
    super
    @type = :passenger
  end

end
