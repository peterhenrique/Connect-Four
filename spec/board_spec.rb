require_relative '../lib/board'

describe Board do
  # criar array 7 x 6
  describe 'create grid' do
    subject(:board) { described_class.new }
    context 'creates a multidimensional array of size 7 with arrays of size 7' do
      let(:array) { subject.create_grid(7) }
      it 'array size is 7' do
        expect(array.size).to eq(7)
      end
      it 'has an array inside sized 7' do
        expect(array[0].size).to eq(7)
      end

      it 'last number is unicode' do
        expect(array.last.last).to eq("\u274D")
      end

      it 'last number is 1' do
        new_array = subject.first_number(array)
        expect(array.first.last).to eq(1)
      end
    end
  end

  describe 'show board' do
    subject(:board) { described_class.new }
    let(:board_to_show) { subject.create_board(2) }

    context 'function' do
      it 'creates a function to correct order' do
        column = 1
        ready_to_print = subject.printer(board_to_show, column)
        # puts ready_to_print
        expect(ready_to_print).to eq([board_to_show[0][column - 1], board_to_show[1][column - 1]])
      end
    end

    context '#printing press' do
      it 'array has same size as board' do
        array_printish = subject.printing_ready(board_to_show)
        expect(array_printish.length).to eq(board_to_show.length)
      end
    end
  end
end
