require './lib/boat'
require './lib/renter'

RSpec.describe Boat do 
  before(:each) do 
    @kayak = Boat.new(:kayak, 20)
    @canoe = Boat.new(:canoe, 10)
  end
  it 'exists' do 
    expect(@kayak).to be_a(Boat)
  end

  it 'has readable attributes' do
    expect(@kayak.type).to eq(:kayak)
    expect(@kayak.price_per_hour).to eq(20)
    expect(@kayak.hours_rented).to eq(0)
  end

  it '#add_hour' do
    @kayak.add_hour
    @kayak.add_hour
    @kayak.add_hour
    
    expect(@kayak.hours_rented).to eq 3
  end
end