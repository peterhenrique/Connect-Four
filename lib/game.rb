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

    def counts_spaces(board, counter_1 = 0, counter_2 = 0)
        for i in 0..board.size-1
            if  board[i] == "\u26AA"
                counter_1 += 1 &&  counter_2 = 0
            elsif board[i] == "\u26AB"
                counter_1 = 0 && counter_2 += 1
            else
                counter_1 = 0 && counter_2 = 0
            end
         end
        [counter_1, counter_2]
    end

    def stopper(counter_1)

        
    end

    
end

