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

    def four_equals(array)
        array.each_cons(4) do |one, two, three, four|
            arr = [one, two, three, four].uniq
            return arr if arr.uniq.size == 1                      
        end 
        false       
    end

    def evaluate_column(column)

    end



    
end

