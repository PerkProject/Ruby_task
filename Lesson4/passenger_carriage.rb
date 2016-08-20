class PassengerCarriage < Carriage
  attr_reader :type

  def initialize (carriage_number)
    super
    @type = "passenger"
  end

end
