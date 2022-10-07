require_relative '../lib/game'

describe Game do
    describe 'find winner' do


        context '#finds 4 equals' do
            subject(:game_1) { described_class.new(7) }            

            let(:board_1) {subject.board.board}


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
end