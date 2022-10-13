require_relative 'unicode'
class Player
    attr_accessor :symbol, :name, :score
    include Unicode
    def initialize(name, symbol, score)
        @name = name
        @symbol = symbol
        @score = score
    end

end