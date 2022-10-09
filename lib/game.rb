require_relative 'board'
require_relative 'player'
require_relative 'unicode'
require 'pry-byebug'

class Game
    attr_accessor :board
    include Unicode
    def initialize(number)
        @board = Board.new(number)

    end

    def turn(array, symbol, counter = 0)
        array[counter] == "\u25EF" ? array[counter] = symbol : turn(array, symbol, counter += 1)
    end




    
end

