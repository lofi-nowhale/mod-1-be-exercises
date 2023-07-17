require 'rspec'
require './lib/apartment'
require './lib/room'

RSpec.describe Apartment do 
  it 'exists' do 
    apartment = Apartment.new

    expect(apartment).to be_an Apartment
  end

  describe '#is_rented' do
    it 'can return a boolean of if the apartment is rented or not' do
      apartment = Apartment.new

      expect(apartment.is_rented?).to eq(false)

      apartment.rent

      expect(apartment.is_rented?).to eq(true)
    end
  end

  describe '#add_room' do
    it 'can add a room and list the rooms alpha metically' do 
      apartment = Apartment.new
      bathroom = Room.new("bathroom")

      apartment.add_room(bathroom)
      expect(apartment.rooms).to eq(["bathroom"])

      apartment.add_room(Room.new("laundry"))
      apartment.add_room(Room.new("kitchen"))
      apartment.add_room(Room.new("bedroom"))
      
      expect(apartment.rooms).to eq(["bathroom", "laundry", "kitchen", "bedroom"])

      expect(apartment.list_rooms_by_name_alphabetically).to eq(["bathroom", "bedroom", "kitchen", "laundry"])
    end
  end



end