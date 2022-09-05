require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require 'rspec'

RSpec.describe Game do
  describe '#initialize' do

    it 'exists' do
      game = Game.new
      expect(game).to be_an_instance_of(Game)
    end
  end

  describe '#computer_setup' do
    it 'sets up the ships for computer and player' do
     game = Game.new
     game.computer_setup
     expect(game.computer_board.render != game.computer_board.render(true)).to eq(true)
    end
  end

  describe '#computer_shot' do
    it 'computer fires upon player board' do
      game = Game.new
      game.computer_shot
      expect(game.player_board.cells[game.poss_cpu_shot].fired_upon?).to eq(true)
    end
  end

  describe '#comp_has_lost?' do
    it 'checks if computer lost' do
      game = Game.new
      expect(game.comp_has_lost?).to eq(false)
      game.computer_board.place(game.computer_cruiser, ["A1", "A2", "A3"])
      game.computer_board.place(game.computer_submarine, ["C1", "C2"])
      game.computer_board.cells["A1"].fire_upon
      game.computer_board.cells["A2"].fire_upon
      game.computer_board.cells["A3"].fire_upon
      game.computer_board.cells["C1"].fire_upon
      game.computer_board.cells["C2"].fire_upon
      expect(game.comp_has_lost?).to eq(true)
    end
  end

  describe '#player_has_lost?' do
    it 'checks if player lost' do
      game = Game.new
      expect(game.player_has_lost?).to eq(false)
      game.player_board.place(game.player_cruiser, ["A1", "A2", "A3"])
      game.player_board.place(game.player_submarine, ["C1", "C2"])
      game.player_board.cells["A1"].fire_upon
      game.player_board.cells["A2"].fire_upon
      game.player_board.cells["A3"].fire_upon
      game.player_board.cells["C1"].fire_upon
      game.player_board.cells["C2"].fire_upon
      expect(game.player_has_lost?).to eq(true)
    end
  end


end
