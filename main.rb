require_relative './lib/game'
require_relative './lib/player'

class Game_start
    attr_accessor :winning_con
    include Unicode

    def initialize
        @winning_con = false
        @player_one = player_creation(player_1)
        @player_two = player_creation(player_2)
        game_start
        
    end

    def create_players(name, symbol)
        Player.new(name, symbol, 0)
    end

    def game_start
        @winning_con = false
        @game = Game.new(7)
        until winning_con == true
            move(@player_one)
            break if winning_con == true
            move(@player_two)
        end
    end

    def ask_name
        puts "What is your name?"
        gets.chomp
    end

    def player_creation(symbol)
        name = ask_name
        create_players(name, symbol)
    end

    def ask_column(player)
        puts "Select Column #{player.name}"
        gets.chomp
    end

    def playing_turn(player, game = @game)
        column = ask_column(player).to_i
        game.play_turn(column, player.symbol)
    end

    def turn_and_evaluate(player, game = @game)
        playing_turn(player) 
        evaluation(player)
    end

    def player_win(player)
        player.score += 1
        @winning_con = true
        declare_winner(player)
        play_again
    end

    def declare_winner(player)
        puts "#{player.name} won!"
        puts "#{player.name}:#{player.score}"
    end

    def play_again
        puts "do you want to play again (y/n)?"
        answer = gets.chomp
        answer == 'y' ? game_start : puts('Thank you for playing!')
    end

    def evaluation(player, game = @game)
        game.evaluate_turn != false ? player_win(player) : false
    end

    def move(player)
        turn_and_evaluate(player)
        puts @game.board.printing_press
    end
end


Game_start.new

