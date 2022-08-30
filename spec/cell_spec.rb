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
end
