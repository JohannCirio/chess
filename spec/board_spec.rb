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
  describe '#print_board' do
    
  end
end
