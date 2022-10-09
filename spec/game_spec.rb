require_relative '../lib/game'

describe Game do

    describe '#turn' do
        context 'player 1' do
            subject(:game_3) { described_class.new(3) }            

            let(:board_3) {subject.board.board}
          
      
            it 'changes the avaliable selected row cell to player symbol' do
                subject.turn(board_3[0], "\u26AA" )

                expect(board_3[0][0]).to eql("\u26AA")
            end
        end
    end
    

 
end