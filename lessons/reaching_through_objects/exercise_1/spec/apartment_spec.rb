require 'rspec'
require './lib/apartment'

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



end