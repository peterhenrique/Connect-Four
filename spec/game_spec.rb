require_relative '../lib/game'

describe Game do
    describe 'find winner' do


        context '#counts_spaces' do
            subject(:game_1) { described_class.new(4) }            

            let(:board_1) {subject.board.board}


           context 'all white' do 
            it 'does not count a blank space' do
                expect(subject.counts_spaces(board_1[0])).to eq([0, 0])
            end
           end

           context 'black' do

            before do
                board_1[0][-2] = "\u26AA"
            end
            it 'changes counter_1' do
                expect(subject.counts_spaces(board_1[0][0..-2])).to eq([1, 0])
            end
           end

           context 'player 2' do 
            before do
                board_1[0][-2] = "\u26AB"
            end
                it 'changes counter_2' do
                    expect(subject.counts_spaces(board_1[0][0..-2])).to eq([0, 1])
                end
           end

           context 'player 2 with more' do 
            before do
                board_1[0][-2] = "\u26AB"
                board_1[0][-3] = "\u26AB"
            end
                it 'changes counter_2' do
                    expect(subject.counts_spaces(board_1[0][0..-2])).to eq([0, 2])
                end
           end
        end

        describe 'identify if a count is bigger than 3' do
            context 'identify if count_1 is >= 3' do
                it 'is bigger than 3' do
                    expect(subject.stopper).to be_truthy
                end
            end
        
        end
    end
end