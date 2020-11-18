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
    context 'correctly adds a White Queen to the D1 position of the board' do
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
          first_bishop = @board.matrix[2][0]
          second_bishop = @board.matrix[5][0]
          are_bishops = first_bishop.is_a?(Bishop) && second_bishop.is_a?(Bishop)
          expect(are_bishops).to be true
        end

        it 'bishops are white' do
          first_bishop = @board.matrix[2][0]
          second_bishop = @board.matrix[5][0]
          are_white = first_bishop.color == 'white' && second_bishop.color == 'white'
          expect(are_white).to be true
        end
      end

      context 'towers' do
        it 'are on the right place' do
          first_tower = @board.matrix[0][0]
          second_tower = @board.matrix[7][0]
          are_towers = first_tower.is_a?(Tower) && second_tower.is_a?(Tower)
          expect(are_towers).to be true
        end

        it 'are white' do
          first_tower = @board.matrix[0][0]
          second_tower = @board.matrix[7][0]
          are_white = first_tower.color == 'white' && second_tower.color == 'white'
          expect(are_white).to be true
        end
      end

      context 'knights' do
        it 'are on the right place' do
          first_knight = @board.matrix[1][0]
          second_knight = @board.matrix[6][0]
          are_knights = first_knight.is_a?(Knight) && second_knight.is_a?(Knight)
          expect(are_knights).to be true
        end
        it 'are white' do
          first_knight = @board.matrix[1][0]
          second_knight = @board.matrix[6][0]
          are_white = first_knight.color == 'white' && second_knight.color == 'white'
          expect(are_white).to be true
        end
      end

      context 'king' do
        it 'is on the right place' do
          piece = @board.matrix[3][0]
          expect(piece).to be_a(King)
        end

        it 'is white' do
          piece_color = @board.matrix[3][0].color
          expect(piece_color).to eq('white')
        end
      end

      context 'queen' do
        it 'is on the right place' do
          piece = @board.matrix[4][0]
          expect(piece).to be_a(Queen)
        end

        it 'is white' do
          piece_color = @board.matrix[4][0].color
          expect(piece_color).to eq('white')
        end
      end
    end

    context 'black pieces' do
      context 'pawns' do
        it 'are on the right place' do
          is_pawn = @board.matrix.all? { |column| column[6].is_a?(Pawn) }
          expect(is_pawn).to be true
        end

        it 'are black' do
          black = @board.matrix.all? { |column| column[6].color == 'black' }
          expect(black).to be true
        end
      end

      context 'bishops' do
        it 'bishops are on the right place' do
          first_bishop = @board.matrix[2][7]
          second_bishop = @board.matrix[5][7]
          are_bishops = first_bishop.is_a?(Bishop) && second_bishop.is_a?(Bishop)
          expect(are_bishops).to be true
        end

        it 'bishops are black' do
          first_bishop = @board.matrix[2][7]
          second_bishop = @board.matrix[5][7]
          are_black = first_bishop.color == 'black' && second_bishop.color == 'black'
          expect(are_black).to be true
        end
      end

      context 'towers' do
        it 'are on the right place' do
          first_tower = @board.matrix[0][7]
          second_tower = @board.matrix[7][7]
          are_towers = first_tower.is_a?(Tower) && second_tower.is_a?(Tower)
          expect(are_towers).to be true
        end

        it 'are black' do
          first_tower = @board.matrix[0][7]
          second_tower = @board.matrix[7][7]
          are_black = first_tower.color == 'black' && second_tower.color == 'black'
          expect(are_black).to be true
        end
      end

      context 'knights' do
        it 'are on the right place' do
          first_knight = @board.matrix[1][7]
          second_knight = @board.matrix[6][7]
          are_knights = first_knight.is_a?(Knight) && second_knight.is_a?(Knight)
          expect(are_knights).to be true
        end
        it 'are black' do
          first_knight = @board.matrix[1][7]
          second_knight = @board.matrix[6][7]
          are_black = first_knight.color == 'black' && second_knight.color == 'black'
          expect(are_black).to be true
        end
      end

      context 'king' do
        it 'is on the right place' do
          piece = @board.matrix[3][7]
          expect(piece).to be_a(King)
        end

        it 'is black' do
          piece_color = @board.matrix[3][7].color
          expect(piece_color).to eq('black')
        end
      end

      context 'queen' do
        it 'is on the right place' do
          piece = @board.matrix[4][7]
          expect(piece).to be_a(Queen)
        end

        it 'is black' do
          piece_color = @board.matrix[4][7].color
          expect(piece_color).to eq('black')
        end
      end
    end

  end
end
