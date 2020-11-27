require './misc/graph_structure.rb'

# implements the Pawn chess piece
class Pawn
  attr_reader :color, :token, :current_column, :current_row
  def initialize(color, column, row)
    @color = color
    choose_token(color)
    @current_column = column
    @current_row = row
  end

  def choose_token(color)
    @token = color == 'white' ? '♟' : '♙'
  end
end

# implements the Knight chess piece
class Knight
  attr_reader :color, :token, :current_column, :current_row
  def initialize(color, column, row)
    @color = color
    choose_token(color)
    @current_column = column
    @current_row = row
  end

  def choose_token(color)
    @token = color == 'white' ? '♞' : '♘'
  end
end

# implements the Queen chess piece
class Queen
  attr_reader :color, :token, :current_column, :current_row
  def initialize(color, column, row)
    @color = color
    choose_token(color)
    @current_column = column
    @current_row = row
  end

  def choose_token(color)
    @token = color == 'white' ? '♚' : '♔'
  end
end

# implements the Bishop chess piece
class Bishop
  attr_reader :color, :token, :current_column, :current_row
  def initialize(color, column, row)
    @color = color
    choose_token(color)
    @current_column = column
    @current_row = row
  end

  def choose_token(color)
    @token = color == 'white' ? '♝' : '♗'
  end
end

# implements the Tower chess piece
class Tower
  attr_reader :color, :token, :current_column, :current_row, :board_graph
  def initialize(color, column, row)
    @color = color
    choose_token(color)
    @current_column = column
    @current_row = row
    @board_graph = BoardGraph.new
    add_moves
  end

  def choose_token(color)
    @token = color == 'white' ? '♜' : '♖'
  end

  def add_moves
    @board_graph.tiles.each do |tile|
      up_move(tile)
      down_move(tile)
      left_move(tile)
      right_move(tile)
    end
  end

  def up_move(tile)
    new_y = tile.y_value + 1
    tile.add_adjacent_vertex(@board_graph.find_tile(tile.x_value, new_y)) if new_y < 8
  end

  def down_move(tile)
    new_y = tile.y_value - 1
    tile.add_adjacent_vertex(@board_graph.find_tile(tile.x_value, new_y)) if new_y >= 0
  end

  def left_move(tile)
    new_x = tile.x_value - 1
    tile.add_adjacent_vertex(@board_graph.find_tile(new_x, tile.y_value)) if new_x >= 0
  end

  def right_move(tile)
    new_x = tile.x_value + 1
    tile.add_adjacent_vertex(@board_graph.find_tile(new_x, tile.y_value)) if new_x < 8
  end

end

# implements the King chess piece
class King
  attr_reader :color, :token, :current_column, :current_row
  def initialize(color, column, row)
    @color = color
    choose_token(color)
    @current_column = column
    @current_row = row
  end

  def choose_token(color)
    @token = (color == 'white' ? '♛' : '♕')
  end
end

torre = Tower.new('black', 0, 0)
torre.board_graph.tiles.each do |tile|
  tile.print_vertex_adjacency_list
end
