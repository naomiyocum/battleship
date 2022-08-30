require './lib/ship'
require 'rspec'

RSpec.describe Ship do

  describe '#initialize' do
    it 'exists' do
      cruiser = Ship.new("Cruiser", 3)
      expect(cruiser).to be_an_instance_of(Ship)
      expect(cruiser.name).to eq("Cruiser")
      expect(cruiser.length).to eq(3)
    end
  end

  describe '#health' do
    it 'has health' do
      cruiser = Ship.new("Cruiser", 3)
      expect(cruiser.health).to eq(3)
    end
  end

  describe '#sunk?' do
    it 'has ship shunk?' do
      cruiser = Ship.new("Cruiser", 3)
      expect(cruiser.sunk?).to eq(false)
    end
  end

  describe '#hit' do
    it 'has been hit' do
      cruiser = Ship.new("Cruiser", 3)
      cruiser.hit
      expect(cruiser.health).to eq(2)
      cruiser.hit
      cruiser.hit
      expect(cruiser.sunk?).to eq(true)
    end
  end

end
