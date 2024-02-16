class Potluck
  attr_reader :date, :dishes
  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def get_all_from_category(category)
    cat_dishes = []
    
    @dishes.each do |dish| 
      if dish.category == category
        cat_dishes << dish
      end
    end
    cat_dishes
  end

  def menu
    potluck_menu = {
      :appetizers => [],
      :desserts => [],
      :entres => []
    }

    @dishes.each do |dish|
      if dish.category == :appetizer
        potluck_menu[:appetizers] << dish.name
      elsif dish.category == :dessert
        potluck_menu[:desserts] << dish.name
      else 
        potluck_menu[:entres] << dish.name
      end
    end

    potluck_menu.each { |category, dishes| potluck_menu[category] = dishes.sort}

    potluck_menu
  end
end