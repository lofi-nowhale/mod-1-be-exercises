require './lib/dish'
require './lib/potluck'

RSpec.describe Potluck do
  it 'exists' do
    potluck = Potluck.new("7-13-18")
    expect(potluck).to be_a Potluck
  end

  it 'has readable attributes' do
    potluck = Potluck.new("7-13-18")

    expect(potluck.date).to eq("7-13-18")
    expect(potluck.dishes).to eq([])
  end

  describe '#add_dish' do
    before(:each) do
      @potluck = Potluck.new("7-13-18")
    end
    it 'can add a dish to the dishes array for a potluck' do
      couscous_salad = Dish.new("Couscous Salad", :appetizer)
      cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)

      @potluck.add_dish(couscous_salad)
      @potluck.add_dish(cocktail_meatballs)

      expect(@potluck.dishes).to eq([couscous_salad, cocktail_meatballs])
      expect(@potluck.dishes.length).to eq(2)
    end
  end

  describe "#get_all_from_category" do
    before(:each) do
      @potluck = Potluck.new("7-13-18")
      @couscous_salad = Dish.new("Couscous Salad", :appetizer)
      @summer_pizza = Dish.new("Summer Pizza", :appetizer)
      @roast_pork = Dish.new("Roast Pork", :entre)
      @cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
      @candy_salad = Dish.new("Candy Salad", :dessert)
      @bean_dip = Dish.new("Bean Dip", :appetizer)

      @potluck.add_dish(@couscous_salad)      
      @potluck.add_dish(@summer_pizza)      
      @potluck.add_dish(@roast_pork)      
      @potluck.add_dish(@cocktail_meatballs)      
      @potluck.add_dish(@candy_salad)
      @potluck.add_dish(@bean_dip)
    end

    it 'can pull all dishes from a certain category' do
      expect(@potluck.get_all_from_category(:appetizer)).to eq([@couscous_salad, @summer_pizza, @bean_dip])
      expect(@potluck.get_all_from_category(:appetizer).first).to eq(@couscous_salad)
      expect(@potluck.get_all_from_category(:appetizer).first.name).to eq("Couscous Salad")
    end
  end

  describe "#menu + #ratio" do
    before(:each) do
      @potluck = Potluck.new("7-13-18")
      @couscous_salad = Dish.new("Couscous Salad", :appetizer)
      @summer_pizza = Dish.new("Summer Pizza", :appetizer)
      @roast_pork = Dish.new("Roast Pork", :entre)
      @cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
      @candy_salad = Dish.new("Candy Salad", :dessert)
      @bean_dip = Dish.new("Bean Dip", :appetizer)

      @potluck.add_dish(@couscous_salad)      
      @potluck.add_dish(@summer_pizza)      
      @potluck.add_dish(@roast_pork)      
      @potluck.add_dish(@cocktail_meatballs)      
      @potluck.add_dish(@candy_salad)
      @potluck.add_dish(@bean_dip)
    end

    it 'returns a hash of the menu with the category as the key and an array of the dish names as the value' do
      expect(@potluck.menu).to eq({:appetizers=>["Bean Dip", "Couscous Salad", "Summer Pizza"],:entres=>["Cocktail Meatballs", "Roast Pork"],:desserts=>["Candy Salad"]})
    end

    it 'returns the ratio of the desired dish to the rest of the dishes' do
      expect(@potluck.ratio(:appetizer)).to eq(50.0)
    end
  end
end