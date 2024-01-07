require 'rspec'
require './lib/activity'

RSpec.describe Activity do 
  before(:each) do
    @activity = Activity.new("Brunch")
  end
  it "esixts and has readable attributes" do
    expect(@activity).to be_an Activity
    expect(@activity.name).to eq("Brunch")
    expect(@activity.participants).to eq({})
    expect(@activity.total_cost).to eq(0)
  end

  describe "#add_participant" do
    it "can add a new participant with the price of their meal" do
      expect(@activity.participants).to eq({})

      @activity.add_participant("Maria", 20)
      expect(@activity.participants).to eq({"Maria" => 20})
      expect(@activity.total_cost).to eq(20)

      @activity.add_participant("Luther", 40)
      expect(@activity.participants).to eq({"Maria" => 20, "Luther" => 40})
      expect(@activity.total_cost).to eq(60)
    end
  end
end