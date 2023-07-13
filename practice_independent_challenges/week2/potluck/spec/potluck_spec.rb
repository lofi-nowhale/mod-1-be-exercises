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
  end
  
end