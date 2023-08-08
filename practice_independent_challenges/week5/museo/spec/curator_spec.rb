require './lib/photograph'
require './lib/artist'
require './lib/curator'

RSpec.describe Curator do 
  before (:each) do 
    @curator = Curator.new 

    @photo_1 = Photograph.new({
      id: "1",      
      name: "Rue Mouffetard, Paris (Boy with Bottles)",      
      artist_id: "1",      
      year: "1954"      
    })   

    @photo_2 = Photograph.new({
      id: "2",      
      name: "Moonrise, Hernandez",      
      artist_id: "2",      
      year: "1941"      
    })     

    @artist_1 = Artist.new({
      id: "1",      
      name: "Henri Cartier-Bresson",      
      born: "1908",      
      died: "2004",      
      country: "France"
    }) 

    @artist_2 = Artist.new({
      id: "2",      
      name: "Ansel Adams",      
      born: "1902",      
      died: "1984",      
      country: "United States"      
    })        

  end

  it "exists and has readable attributes" do 
    expect(@curator.photographs).to eq([])
    expect(@curator.artists).to eq([])
  end

  describe "#add_photograph" do 
    it "can add a photo object to the photographs array for the curator" do
      @curator.add_photograph(@photo_1)

      @curator.add_photograph(@photo_2)
      
      expect(@curator.photographs).to eq([photo_1, photo_2])      
    end
  end
end