require 'rspec'
require './lib/car'
require './lib/dealership'

describe Dealership do
  context 'initialize' do
    dealership = Dealership.new("Acme Auto", "123 Main Street")

    it 'exists' do
      expect(dealership).to be_a(Dealership)
    end

    it 'has readable attributes' do
      expect(dealership.name).to eq("Acme Auto")
      expect(dealership.address).to eq("123 Main Street")
    end
  end

  context 'inventory' do
    dealership = Dealership.new("Acme Auto", "123 Main Street")
    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)

    it 'starts with no inventory' do
      expect(dealership.inventory).to eq([])
    end

    it 'starts with no inventory to count' do
      expect(dealership.inventory_count).to eq(0)
    end

    it 'can add to its inventory' do
      dealership.add_car(car_1)
      dealership.add_car(car_2)

      expect(dealership.inventory).to eq([car_1, car_2])
    end

    it 'can count its inventory' do
      expect(dealership.inventory_count).to eq(2)
    end
  end

  context 'car details' do
    dealership = Dealership.new("Acme Auto", "123 Main Street")
    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)
    car_3 = Car.new("Toyota Tercel", 500, 48)
    car_4 = Car.new("Chevrolet Bronco", 1250, 24)

    it 'inventory' do
      expect(dealership.has_inventory?).to eq(false)
    end

    it 'can list cars by make' do
      dealership.add_car(car_1)
      dealership.add_car(car_2)
      dealership.add_car(car_3)
      dealership.add_car(car_4)

      expect(dealership.cars_by_make("Toyota")).to eq([car_2, car_3])
      expect(dealership.cars_by_make("Ford")).to eq([car_1])
    end

    it 'can find the total value' do
      expect(dealership.total_value).to eq(156000)
    end

    it 'can give dealership details' do
      expected = {
        "total_value" => 156000,
        "address" => "123 Main Street"
      }

      expect(dealership.details).to eq(expected)
    end
  end

  context 'dealership details' do
    dealership = Dealership.new("Acme Auto", "123 Main Street")
    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)
    car_3 = Car.new("Toyota Tercel", 500, 48)
    car_4 = Car.new("Chevrolet Bronco", 1250, 24)
    dealership.add_car(car_1)
    dealership.add_car(car_2)
    dealership.add_car(car_3)
    dealership.add_car(car_4)

    it 'can find average price of cars' do
      expect(dealership.average_price_of_car).to eq("39,000")
    end

    it 'can sort cars by price' do
      expected = [car_3, car_4, car_2, car_1]

      expect(dealership.cars_sorted_by_price).to eq(expected)
    end

    xit 'create an inventory by make' do
      expected = {
        "Ford" => [car_1],
        "Toyota" => [car_2, car_3],
        "Chevrolet" => [car_4]
        }

      expect(dealership.inventory_hash).to eq
    end
  end
end
