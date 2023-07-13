require 'rspec'
require './lib/dish'
require './lib/potluck'

RSpec.describe Potluck do
  it 'exists' do
    potluck = Potluck.new("7-13-18")
    expect(potluck).to be_a(Potluck)
  end

  it 'has readable attributes' do 
    potluck = Potluck.new("7-13-18")
    expect(potluck.date).to eq("7-13-18")
    expect(potluck.dishes).to eq([])
  end

  describe '#add_dish' do
    it 'can add a new instance of the dish class' do
    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    potluck.add_dish(couscous_salad)
    potluck.add_dish(cocktail_meatballs)
    expect(potluck.dishes).to eq([couscous_salad, cocktail_meatballs])
    end
  end

end