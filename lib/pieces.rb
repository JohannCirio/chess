# implements the Pawn chess piece
class Pawn
  attr_reader :color, :token, :current_column, :current_row
  def initialize(color, column, row)
    @token = '♟'
    @color = color
    @current_column = column
    @current_row = row
  end
end

# implements the Knight chess piece
class Knight
  attr_reader :color, :token, :current_column, :current_row
  def initialize(color, column, row)
    @token = '♞'
    @color = color
    @current_column = column
    @current_row = row
  end
end

# implements the Queen chess piece
class Queen
  attr_reader :color, :token, :current_column, :current_row
  def initialize(color, column, row)
    @token = '♚'
    @color = color
    @current_column = column
    @current_row = row
  end
end

# implements the Bishop chess piece
class Bishop
  attr_reader :color, :token, :current_column, :current_row
  def initialize(color, column, row)
    @token = '♝'
    @color = color
    @current_column = column
    @current_row = row
  end
end

# implements the Tower chess piece
class Tower
  attr_reader :color, :token, :current_column, :current_row
  def initialize(color, column, row)
    @token = '♝'
    @color = color
    @current_column = column
    @current_row = row
  end
end

# implements the King chess piece
class King
  attr_reader :color, :token, :current_column, :current_row
  def initialize(color, column, row)
    @token = '♝'
    @color = color
    @current_column = column
    @current_row = row
  end
end
