require_relative 'board'
require_relative 'player'
require_relative 'unicode'
require 'pry-byebug'

class Game
    attr_accessor :board, :winning_con, :evaluate_turn
    include Unicode
    def initialize(number)
        @board = Board.new(number)
    end

    def turn(array, symbol, counter = 0)
        array[counter] == board_unicode ? array[counter] = symbol : turn(array, symbol, counter += 1)
    end

    def select_array(number, board = @board.board)
        board[number-1]
    end

    def play_turn(column, symbol)
        turn_array = select_array(column)
        turn(turn_array, symbol)
    end


    def evaluate_turn(column = 0, board = @board.board)        
       @board.board_evaluator_column(board, column)
    end    
end

