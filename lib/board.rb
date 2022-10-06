require_relative 'unicode'

class Board
  attr_accessor :board, :printing_press

  include Unicode

  def initialize(number)
    @board = create_board(number)
    #printing_press(@board)
  end

  def create_grid(column)
    Array.new(column) { Array.new(column, board_unicode) }
  end


  def first_number(array)
    array.each_with_index { |subarray, index| subarray[-1] = index + 1 }
  end

  def create_board(column)
    array = create_grid(column)
    first_number(array)
  end

  def show_board
    puts "#{@board[0][0]} #{@board[1][0]} "
  end

  def printer(board, column, array = [])
    board.each_with_index { |_coluna, index| array << board[index][column - 1] }
    array
  end

  def printing_ready(board, counter = 0, array = [])
    return if counter == board.size

    array << printer(board, counter)
    printing_ready(board, counter + 1, array)
    array
  end

  def printing_board(board, row = 0)
    return if row == board.size

    printing_array = printing_ready(board)
    printing_board(board, row + 1)
    puts " #{printing_array[row].join('  ')} "
  end

  def printing_press(board)
    puts "\n"
    printing_board(board)
    puts "\n"
  end
end


