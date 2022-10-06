require_relative 'unicode'
class Player
    attr_accessor :input, :name
    include Unicode
    def initialize(name, input, score)
        @name = name
        @input = input
        @score = score
    end

end