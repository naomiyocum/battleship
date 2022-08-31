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
  describe '#render' do
    it 'renders cell when no ship' do
      cell_1 = Cell.new("B4")
      expect(cell_1.render).to eq('.')
      cell_1.fire_upon
      expect(cell_1.render).to eq('M')
    end
    it 'renders cell with ship' do
      cell_2 = Cell.new("C3")
      cruiser = Ship.new("Cruiser", 3)
      cell_2.place_ship(cruiser)
      expect(cell_2.render).to eq('.')
      expect(cell_2.render(true)).to eq('S')
      cell_2.fire_upon
      expect(cell_2.render).to eq('H')
      cruiser.hit
      cruiser.hit
      expect(cruiser.sunk?).to eq(true)
      expect(cell_2.render).to eq('X')
    end
  end
end
