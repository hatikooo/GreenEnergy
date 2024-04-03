class Dealership
  attr_reader :name,
                   :address,
                   :inventory,
                   :inventory_count

  def initialize(name, address )
    @name  = name
    @address = address
    @inventory = []
    @inventory_count = 0
  end

  def add_car(car)
    @inventory << car
    @inventory_count += 1
  end

  def has_inventory?
    return true if @inventory_count > 1
      false
  end

  def cars_by_make(make)
    @inventory.find_all do |cars|
      cars.make == make
    end
  end

  def total_value
    total = @inventory.map do |car|
      car.total_cost
    end
    total.sum
  end

  def details
    detail = {
      "total_value" => total_value,
      "address" => @address
    }
  end

  def average_price_of_car
    average = total_value / @inventory_count
    string = average.to_s
    string.insert(2, ",")
  end

  def cars_sorted_by_price
    @inventory.minmax do |car|
      car.total_cost
    end
  end
end
