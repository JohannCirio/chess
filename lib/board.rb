# ./lib/board.rb

class ChessBoard
  attr_reader :matrix
  def initialize
    generate_board_matrix
  end

  def generate_board_matrix
    @matrix = []
    8.times do
      row_array = []
      8.times { row_array.push(0) }
      @matrix.push(row_array)
    end
  end
end