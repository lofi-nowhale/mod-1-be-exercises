class Dock
  attr_reader :name, :max_rental_time, :rental_log
  
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log = {}
  end

  def rent(boat, renter)
    @rental_log[boat] = renter
  end
  
  def charge(boat)
    # Hash.new { |key, value| key[value] = { card_number: @rental_log[boat].credit_card_number, amount: }} 
    {
      card_number: @rental_log[boat].credit_card_number,
      amount: amount_to_charge(boat)
    }
  end

  def hours_charged(boat)
    if max_rental_time < boat.hours_rented
      max_rental_time
    else
      boat.hours_rented
    end
  end

  def amount_to_charge(boat)
    (boat.price_per_hour * hours_charged(boat))
  end

end