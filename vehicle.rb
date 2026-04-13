class Vehicle
  attr_accessor :make, :model, :year

  def initialize(make, model, year)
    @make = make
    @model = model
    @year = year
  end

  def details
    puts "Make: #{@make}"
    puts "Model: #{@model}"
    puts "Year: #{@year}"
  end
end

class Car < Vehicle
  attr_accessor :vehicle_type

  def initialize(make, model, year)
    super(make, model, year)
    @vehicle_type = "Car"
  end

  def details
    super
    puts "Type: #{@vehicle_type}"
  end
end

class Bike < Vehicle
  attr_accessor :vehicle_type

  def initialize(make, model, year)
    super(make, model, year)
    @vehicle_type = "Bike"
  end

  def details
    super
    puts "Type: #{@vehicle_type}"
  end
end

class Truck < Vehicle
  attr_accessor :vehicle_type

  def initialize(make, model, year)
    super(make, model, year)
    @vehicle_type = "Truck"
  end

  def details
    super
    puts "Type: #{@vehicle_type}"
  end
end

car = Car.new("Toyota", "Corolla", 2022)
bike = Bike.new("Yamaha", "R15", 2021)
truck = Truck.new("Volvo", "FH", 2020)

car.details
bike.details
truck.details