require './lib/ship'
require './lib/cell'
require 'Rspec'

RSpec.describe Cell do
  describe '#initialize' do
    it 'exists' do
      cell = Cell.new("B4")
      expect(cell).to be_an_instance_of(Cell)
      expect(cell.coordinate).to eq("B4")
    end
  end
  describe '#ship' do
    it 'checks for ship' do
      cell = Cell.new("B4")
      expect(cell.ship).to eq(nil)
    end
  end
  describe '#empty?' do
    it 'checks if empty' do
      cell = Cell.new("B4")
      expect(cell.empty?).to eq(true)
    end
  end
  describe '#place_ship' do
    it 'puts ship in cell' do
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)
      expect(cell.ship).to eq(cruiser)
      expect(cell.empty?).to eq(false)
    end
  end
  describe '#fire_upon' do
    it 'fires ship' do
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)
      expect(cell.fired_upon?).to eq(false)
      cell.fire_upon
      expect(cell.ship.health).to eq(2)
      expect(cell.fired_upon?).to eq(true)
    end
  end
end
