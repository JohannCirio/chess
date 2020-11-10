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
end