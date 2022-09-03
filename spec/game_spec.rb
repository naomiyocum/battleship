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

  describe '#setup' do
    it 'sets up the ships for computer and player' do
     game = Game.new
     game.computer_setup
     game.display_boards


    end
  end
end
