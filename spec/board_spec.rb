require './lib/board'
require 'Rspec'
require 'pry'

RSpec.describe Board do
  describe '#initialize' do
    it 'exist'do
      @board = Board.new
      expect(board).to be_an_instance_of(Board)
    end
  end

  describe '#cell hashes' do
    it 'cells are in a hash' do
      expect(board.cells.).to be_a(Hash)
   end
  end

 describe '#board squares eq 16' do
   it 'the cells have a 16 key/value pairs' do
     expect(board.cells.length).to eq(16)
   end
 end

 describe ''




end
