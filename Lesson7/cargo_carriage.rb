class CargoCarriage < Carriage
  attr_reader :capacity_cur

  def initialize(carriage_number, capacity_all)
    @carriage_number = carriage_number
    super(carriage_number)
    @type = :cargo
    @capacity_all = capacity_all.to_f
    @capacity_cur = 0.0
  end

  def fill_capacity(capacity)
    @capacity_cur += capacity.to_f if @capacity_cur < @capacity_all
  end

  def show_free_capacity
    @capacity_all - @capacity_cur
  end
end
