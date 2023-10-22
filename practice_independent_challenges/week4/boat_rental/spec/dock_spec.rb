require 'spec_helper'

RSpec.describe Dock do
  before(:each) do 
    @dock = Dock.new("The Rowing Dock", 3)

    @kayak_1 = Boat.new(:kayak, 20)
    @kayak_2 = Boat.new(:kayak, 20)
    @sup_1 = Boat.new(:standup_paddle_board, 15)

    @patrick = Renter.new("Patrick Star", "4242424242424242")
    @eugene = Renter.new("Eugene Crabs", "1313131313131313")
  end
  it "exists and has readable attributes" do
    
    expect(@dock).to be_a Dock
    expect(@dock.name).to eq("The Rowing Dock")
    expect(@dock.max_rental_time).to eq(3)
  end

  it "#rent and #rental_log" do 
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.rent(@sup_1, @eugene)
    
    expect(@dock.rental_log).to be_a Hash

    expect(@dock.rental_log).to eq({@kayak_1 => @patrick, @kayak_2 => @patrick, @sup_1 => @eugene})
  end

  it "#hours_charged" do
    2.times{@kayak_1.add_hour}
    
    expect(@dock.hours_charged(@kayak_1)).to eq(2)
    
    2.times{@kayak_1.add_hour}

    expect(@dock.hours_charged(@kayak_1)).to eq(3)

  end

  it "#amount_to_charge" do
    2.times{@kayak_1.add_hour}

    expect(@dock.hours_charged(@kayak_1)).to eq(2)

    expect(@dock.amount_to_charge(@kayak_1)).to eq(40)

    2.times{@kayak_1.add_hour}

    expect(@dock.amount_to_charge(@kayak_1)).to eq(60)
  end

  it "#charge" do
    @kayak_1.add_hour
    @kayak_1.add_hour
    @dock.rent(@kayak_1, @patrick)

    expect(@dock.charge(@kayak_1)).to eq({card_number: "4242424242424242", amount: 40})

  end
end