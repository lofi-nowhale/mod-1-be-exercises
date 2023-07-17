class Apartment
  attr_reader :rented
  def initialize
    @rented = false
  end

  def rent
    @rented = true
  end

  def is_rented? 
    if @rented == true
      return true
    end
     false 
  end

end