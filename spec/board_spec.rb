require_relative '../lib/board'

describe Board do
  # criar array 7 x 6
  describe 'create grid' do
    subject(:board) { described_class.new(7) }
    context 'creates a multidimensional array of size 7 with arrays of size 7' do
      let(:array) { subject.create_grid(7) }
      it 'array size is 7' do
        expect(array.size).to eq(7)
      end
      it 'has an array inside sized 7' do
        expect(array[0].size).to eq(7)
      end

      it 'last number is unicode' do
        expect(array.last.last).to eq("\u25EF")
      end

      it 'last number is 1' do
        new_array = subject.first_number(array)
        expect(array.first.last).to eq(1)
      end
    end
  end

  describe 'show board' do
    subject(:board) { described_class.new(7) }
    let(:board_to_show) { subject.create_board(2) }

    context 'function' do
      it 'creates a function to correct order' do
        column = 1
        ready_to_print = subject.printer(board_to_show, column)
        # puts ready_to_print
        expect(ready_to_print).to eq([board_to_show[0][column - 1], board_to_show[1][column - 1]])
      end
    end

    context '#horizontal' do
      it 'array has same size as board' do
        array_printish = subject.horizontal(board_to_show)
        expect(array_printish.length).to eq(board_to_show.length)
      end
    end
  end

  describe '#diagonal_board' do
    subject(:board) { described_class.new(4) }
    let(:array) { subject.board }


    context 'creates a diagonal array' do
      it 'creates from the first' do
        array_test = subject.diagonal_board(array, 0, 0)
        expect(array_test).to eq([array[0][0], array[1][1], array[2][2], array[3][3]])
      end
      it 'creates from the second' do
        array_test = subject.diagonal_board(array, 1, 1)
        expect(array_test).to eq([array[1][1], array[2][2], array[3][3]])
      end
    end
  end

  describe '#inverted_diagonal_board' do
    subject(:board) { described_class.new(4) }
    let(:array) { subject.board }
    context 'creates an inverted diagonal array' do
      it 'creates from the last' do
        array_test = subject.inverted_diagonal_board(array, 3, 0)
        expect(array_test).to eq([array[3][0], array[2][1], array[1][2], array[0][3]])
      end
      it 'creates from the second' do
        array_test = subject.inverted_diagonal_board(array, 3, 1)
        expect(array_test).to eq([array[3][1], array[2][2], array[1][3]])
      end
    end
  end


  describe 'four_equals' do
    context '#finds 4 equals' do
        subject(:game_1) { described_class.new(7) }            

        let(:board_1) {subject.board}


       context 'is truthy' do 
        it 'identifies all empty' do
            expect(subject.four_equals(board_1[0])).to eq(["\u25EF"])
        end
       end

       context 'all black' do
        it 'finds all black' do
            board_1[0][0] = "\u26AB"

            board_1[0][1] = "\u26AB"

            board_1[0][2] = "\u26AB"

            board_1[0][3] = "\u26AB"
            expect(subject.four_equals(board_1[0])).to eq(["\u26AB"])
        end
        it 'finds all black separeted and return true' do
            board_1[0][0] = "\u26AB"

            board_1[0][2] = "\u26AB"

            board_1[0][4] = "\u26AB"

            board_1[0][6] = "\u26AB"
            expect(subject.four_equals(board_1[0])).to be_falsy
        end
       end

       context 'first and last black' do
        it 'sends false' do
            board_1[0][0] = "\u26AB"

            board_1[0][3] = "\u26AB"
            expect(subject.four_equals(board_1[0])).to be_falsy
        end
       end
    end
  end

  describe 'organize_to_evaluate' do
    subject(:game_2) { described_class.new(4) }            

    let(:board_2) {subject.board}

    context 'all are equal' do
        it 'returns an array with all possible columns to be evaluated' do
            horizontal = subject.horizontal(board_2)
            diagonal = subject.diagonal_board(board_2, 0, 0)
            inverted_diagonal_board = subject.inverted_diagonal_board(board_2, 0, 0)
            expect(subject.organize_to_evaluate(board_2, 0, 0)).to eql([board_2[0], horizontal[0], diagonal, inverted_diagonal_board])
        end
    end

    context 'first and last black' do
      it 'sends false' do
          board_2[0][0] = "\u26AB"

          board_2[0][3] = "\u26AB"
          horizontal = subject.horizontal(board_2)
          diagonal = subject.diagonal_board(board_2, 0, 0)
          inverted_diagonal_board = subject.inverted_diagonal_board(board_2, 0, 0)
          expect(subject.organize_to_evaluate(board_2, 0, 0)).to eql([board_2[0], horizontal[0], diagonal, inverted_diagonal_board])
      end
    end
  end

  describe '#board_evaluator' do
    context 'after a turn it declares if the game is won or not and returns the equal' do
      subject(:game_3) { described_class.new(5) }            

      let(:board_3) {subject.board}
      it 'returns false if empty' do
        expect(subject.board_evaluator_column(board_3, 0)).to be_falsy
      end

      it 'returns black if column 1 == black' do
        board_3[0][0] = "\u26AB"
        board_3[0][1] = "\u26AB"
        board_3[0][2] = "\u26AB"
        board_3[0][3] = "\u26AB"       


        expect(subject.board_evaluator_column(board_3, 0)).to eq(["\u26AB"])
      end

      it 'returns black if diagonal 1 == black' do
        board_3[0][0] = "\u26AB"
        board_3[1][1] = "\u26AB"
        board_3[2][2] = "\u26AB"
        board_3[3][3] = "\u26AB"       


        expect(subject.board_evaluator_column(board_3, 0)).to eq(["\u26AB"])
      end
    end
  end
end
