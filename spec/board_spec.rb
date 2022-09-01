require './lib/ship'
require './lib/cell'
require './lib/board'
require 'Rspec'

RSpec.describe Board do
  describe '#initialize' do
    it 'exist' do
      board = Board.new
      expect(board).to be_an_instance_of(Board)
    end
  end

  describe '#cell hashes' do
    it 'cells are in a hash' do
      board = Board.new
      expect(board.cells).to be_a(Hash)
   end
  end

 describe '#board squares eq 16' do
   it 'the cells have a 16 key/value pairs' do
     board = Board.new
     expect(board.cells.length).to eq(16)
   end
 end

 describe '#valid_coordinate?' do
   it 'has valid coordinate' do
     board = Board.new
     expect(board.valid_coordinate?("A1")).to eq(true)
     expect(board.valid_coordinate?("D4")).to eq(true)
     expect(board.valid_coordinate?("A5")).to eq(false)
     expect(board.valid_coordinate?("E1")).to eq(false)
     expect(board.valid_coordinate?("A22")).to eq(false)
   end
 end

 describe '#valid_placement?' do
   it 'has correct length' do
     board = Board.new
     cruiser = Ship.new("Cruiser", 3)
     submarine = Ship.new("Submarine", 2)
     expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
     expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
   end

   it 'is consecutive' do
     board = Board.new
     cruiser = Ship.new("Cruiser", 3)
     submarine = Ship.new("Submarine", 2)
     expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
     expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
     expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
     expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
   end

   it 'cannot be diagonal' do
     board = Board.new
     cruiser = Ship.new("Cruiser", 3)
     submarine = Ship.new("Submarine", 2)
     expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
     expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
     expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
     expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
   end
 end

  describe '#place' do
     it 'places ship' do
       board = Board.new
       cruiser = Ship.new("Cruiser", 3)
       board.place(cruiser, ["A1", "A2", "A3"])
       cell_1 = board.cells["A1"]
       cell_2 = board.cells["A2"]
       cell_3 = board.cells["A3"]
       expect(cell_1.ship).to eq(cruiser)
       expect(cell_2.ship).to eq(cruiser)
       expect(cell_3.ship).to eq(cruiser)
       expect(cell_3.ship == cell_2.ship).to eq(true)
     end
  end
  
  describe '#free?' do
      it 'checks for overlap' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      board.place(cruiser, ["A1", "A2", "A3"])
      submarine = Ship.new("Submarine", 2)
      expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)
      end
    end
    
   describe '#render' do
    it 'renders the board' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      board.place(cruiser, ["A1", "A2", "A3"])
      expect(board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
      expect(board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
      board.cells["A1"].fire_upon
      board.cells["B4"].fire_upon
      board.cells["C1"].fire_upon
      board.cells["A2"].fire_upon
      board.cells["A3"].fire_upon
      expect(board.render).to eq("  1 2 3 4 \nA X X X . \nB . . . M \nC M . . . \nD . . . . \n")
    end
  end

end
