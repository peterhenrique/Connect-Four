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

            it 'changes the avaliable selected row cell to player symbol' do
                board_3[0][0] = "\u26AA" 
                subject.turn(board_3[0], "\u26AA" )

                expect(board_3[0][1]).to eql("\u26AA")
            end
        end
    end

    describe '#select_array' do
        context 'player 1' do
            subject(:game_3) { described_class.new(3) }            

            let(:board_4) {subject.board.board}
          
      
            it 'selects the correct array' do
                array = board_4[1]
                expect(subject.select_array(2)).to eql(array)
            end
           
        end
    end

    describe '#play_turn' do
        context 'player 1' do
            subject(:game_5) { described_class.new(3) }            

            let(:board_5) {subject.board.board}
          
      
            it 'changes the correct array' do
                subject.play_turn(2, "\u26AA")
                expect(board_5[1][0]).to eql("\u26AA")
            end
           
        end
    end

    describe '#evaluate_turn' do
        context 'after a turn it declares if the game is won or not and returns the equal' do
          subject(:game_6) { described_class.new(5) }            
    
          let(:board) {subject.board.board}
          it 'returns false if empty' do
            expect(subject.evaluate_turn).to be_falsy
          end
    
          it 'returns black if column 1 == black' do
            board[0][0] = "\u26AB"
            board[0][1] = "\u26AB"
            board[0][2] = "\u26AB"
            board[0][3] = "\u26AB"       
    
    
            expect(subject.evaluate_turn).to eq(["\u26AB"])
          end
    
          it 'returns black if diagonal 1 == black' do
            board[0][0] = "\u26AB"
            board[1][1] = "\u26AB"
            board[2][2] = "\u26AB"
            board[3][3] = "\u26AB"       
    
    
            expect(subject.evaluate_turn).to eq(["\u26AB"])
          end
        end
      end
    
    

 
end