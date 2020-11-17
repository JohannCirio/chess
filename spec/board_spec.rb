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
    it 'starts with zeros in all tiles' do
      @board.matrix
      all_zeros = @board.matrix.all? { |row| row.all?(0) }
      expect(all_zeros).to be true
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
      
end
