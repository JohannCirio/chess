# ./spec/board_spec.rb

require './lib/board'

describe ChessBoard do
  before { @board = ChessBoard.new }
  context 'is correctly initialized' do
    it 'has 8 columns' do
      number_of_columns = @board.matrix.size
      expect(number_of_columns).to eq(8)
    end

    it 'has 8 rows for each column' do
      columns = @board.matrix
      right_num_of_columns = columns.all? { |column| column.size == 8 }
      expect(right_num_of_columns).to be true
    end
  end
  describe '#change_tile_content' do
    context 'correctly adds a White Queen to the H1 position of the board' do
      it 'its color is white' do
        white_queen = double('Queen', color: 'white', token: '♚')
        @board.change_tile_content(white_queen, 0, 7)
        tile_content = @board.matrix[0][7]
        expect(tile_content.color).to eql('white')
      end

      it 'its token is a ♚' do
        white_queen = double('Queen', color: 'white', token: '♚')
        @board.change_tile_content(white_queen, 0, 7)
        tile_content = @board.matrix[0][7]
        expect(tile_content.token).to eql('♚')
      end
    end
  end

  describe '#set_starting_positions' do
    context 'white pieces' do
      context 'pawns' do
        it 'are on the right place' do
          is_pawn = @board.matrix.all? { |column| column[1].is_a?(Pawn) }
          expect(is_pawn).to be true
        end

        it 'are white' do
          white = @board.matrix.all? { |column| column[1].color == 'white' }
          expect(white).to be true
        end
      end

      context 'bishops' do
        it 'bishops are on the right place' do
          f8_bishop = @board.matrix[2][0]
          c8_bishop = @board.matrix[5][0]
          are_bishops = f8_bishop.is_a?(Bishop) && c8_bishop.is_a?(Bishop)
          expect(are_bishops).to be true
        end

        it 'bishops are white' do
          f8_bishop = @board.matrix[2][0]
          c8_bishop = @board.matrix[5][0]
          are_white = f8_bishop.color == 'white' && c8_bishop.color == 'white'
          expect(are_white).to be true
        end
      end

      context 'towers' do
        it 'are on the right place' do
          h8_tower = @board.matrix[0][0]
          a8_tower = @board.matrix[7][0]
          are_towers = h8_tower.is_a?(Tower) && a8_tower.is_a?(Tower)
          expect(are_towers).to be true
        end

        it 'are white' do
          h8_tower = @board.matrix[0][0]
          a8_tower = @board.matrix[7][0]
          are_white = h8_tower.color == 'white' && a8_tower.color == 'white'
          expect(are_white).to be true
        end
      end

      context 'knights' do
        it 'are on the right place' do
          g8_knight = @board.matrix[1][0]
          b8_knight = @board.matrix[6][0]
          are_knights = g8_knight.is_a?(Knight) && b8_knight.is_a?(Knight)
          expect(are_knights).to be true
        end
        it 'are white' do
          g8_knight = @board.matrix[1][0]
          b8_knight = @board.matrix[6][0]
          are_white = g8_knight.color == 'white' && b8_knight.color == 'white'
          expect(are_white).to be true
        end
      end

      context 'king' do
        it 'is on the right place' do
          e8_piece = @board.matrix[3][0]
          expect(e8_piece).to be_a(King)
        end

        it 'is white' do
          e8_piece_color = @board.matrix[3][0].color
          expect(e8_piece_color).to eq('white')
        end
      end

      context 'queen' do
        it 'is on the right place' do
          d8_piece = @board.matrix[4][0]
          expect(d8_piece).to be_a(Queen)
        end

        it 'is white' do
          d8_piece_color = @board.matrix[4][0].color
          expect(d8_piece_color).to eq('white')
        end
      end
    end
  end
end
