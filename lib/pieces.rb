class Pawn
  attr_reader :color, :token, :current_column, :current_row
  def initialize(color, column, row)
    @token = '♟'
    @color = color
    @current_column = column
    @current_row = row
  end
end