require_relative 'unicode'


require 'pry-byebug'
class Board
  attr_accessor :board, :printing_press

  include Unicode

  def initialize(number)
    @board = create_board(number)
   # printing_press
  end

#### creating board


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
  
#evaluation

  def printer(board, column, array = [])
    board.each_with_index { |_coluna, index| array << board[index][column - 1] }
    array
  end

  def horizontal(board, counter = 0, array = [])
    return if counter == board.size

    array << printer(board, counter)
    horizontal(board, counter + 1, array)
    array
  end

  def diagonal_board(board, column, row, result = [])    
    return if row == board.size

    result << board[column][row]


    diagonal_board(board, column += 1, row += 1, result)  
    result
  end

  def inverted_diagonal_board(board, column, row, result = [])

    return if row >= board.size

    result << board[column][row]


    return result if column == 0
    inverted_diagonal_board(board, column -1, row += 1, result)
    result
  end
  

  
  def four_equals(array)
    return false if array.nil?
   array.each_cons(4) do |one, two, three, four|
        arr = [one, two, three, four].uniq        
        return arr if arr.uniq.size == 1 unless arr == [board_unicode]                     
    end 
    false       
  end

  def organize_to_evaluate(board, column, row)
    horizontal = horizontal(board)
    diagonal_board = diagonal_board(board, column, row)
    
    inverted_diagonal_board = inverted_diagonal_board(board, column, row)
    return [board[row], horizontal[row], diagonal_board, inverted_diagonal_board]    
  end

  def board_evaluator_column(board, column, column_to_evaluate = [], avaluated = [])
    i = 0
    until i == board.size 

      column_to_evaluate = organize_to_evaluate(board, column, i)
      j = 0
      until j == board.size 
        avaluated = four_equals(column_to_evaluate[j])
        return avaluated if avaluated != false
        
        j += 1
      end
      i += 1
    end

    avaluated

    
  end

#show board

  def printing_board(board, row = 0)
    return if row == board.size

    printing_array = horizontal(board)
    printing_board(board, row + 1)
    puts " #{printing_array[row].join('  ')}"
  end

  def printing_press(board = @board)
    puts "\n"
    printing_board(board)
    puts "\n"
  end
end




