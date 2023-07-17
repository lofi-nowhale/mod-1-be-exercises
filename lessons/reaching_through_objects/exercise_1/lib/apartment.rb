class Apartment
  attr_reader :rented, :rooms
  attr_accessor :rooms
  def initialize
    @rented = false
    @rooms = []
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

  def add_room(room)
    @rooms << room.name
  end

  def list_rooms_by_name_alphabetically
    @rooms.sort
  end

end