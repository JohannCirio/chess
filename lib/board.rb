# ./lib/board.rb
require 'colorize'
require './lib/pieces.rb'

# generates the game board and manipulates it's contents
class ChessBoard
  attr_reader :matrix
  def initialize
    generate_board_matrix
    set_starting_positions
  end

  def generate_board_matrix
    @matrix = []
    8.times do
      row_array = []
      8.times { row_array.push(0) }
      @matrix.push(row_array)
    end
  end

  def set_starting_positions
    set_paws
    set_towers
    set_knights
    set_bishops
    set_kings
    set_queens
  end

  def set_paws
    8.times { |i| change_tile_content(Pawn.new('white', i, 1), i, 1) }
    8.times { |i| change_tile_content(Pawn.new('black', i, 6), i, 6) }
  end

  def set_towers
    change_tile_content(Tower.new('white', 0, 0), 0, 0)
    change_tile_content(Tower.new('white', 7, 0), 7, 0)
    change_tile_content(Tower.new('black', 0, 7), 0, 7)
    change_tile_content(Tower.new('black', 7, 7), 7, 7)
  end

  def set_knights
    change_tile_content(Knight.new('white', 1, 0), 1, 0)
    change_tile_content(Knight.new('white', 6, 0), 6, 0)
    change_tile_content(Knight.new('black', 1, 7), 1, 7)
    change_tile_content(Knight.new('black', 6, 7), 6, 7)
  end

  def set_bishops
    change_tile_content(Bishop.new('white', 2, 0), 2, 0)
    change_tile_content(Bishop.new('white', 5, 0), 5, 0)
    change_tile_content(Bishop.new('black', 2, 7), 2, 7)
    change_tile_content(Bishop.new('black', 5, 7), 5, 7)
  end

  def set_kings
    change_tile_content(King.new('white', 3, 0), 3, 0)
    change_tile_content(King.new('black', 3, 7), 3, 7)
  end

  def set_queens
    change_tile_content(Queen.new('white', 4, 0), 4, 0)
    change_tile_content(Queen.new('black', 4, 7), 4, 7)
  end

  def print_board
    puts '╔═╤═╤═╤═╤═╤═╤═╤═╗'
    print_line(7)
    puts '╟─┼─┼─┼─┼─┼─┼─┼─╢'
    print_line(6)
    puts '╟─┼─┼─┼─┼─┼─┼─┼─╢'
    print_line(5)
    puts '╟─┼─┼─┼─┼─┼─┼─┼─╢'
    print_line(4)
    puts '╟─┼─┼─┼─┼─┼─┼─┼─╢'
    print_line(3)
    puts '╟─┼─┼─┼─┼─┼─┼─┼─╢'
    print_line(2)
    puts '╟─┼─┼─┼─┼─┼─┼─┼─╢'
    print_line(1)
    puts '╟─┼─┼─┼─┼─┼─┼─┼─╢'
    print_line(0)
    puts '╚═╧═╧═╧═╧═╧═╧═╧═╝'
    puts ' 0 1 2 3 4 5 6 7'
    puts ' a b c d e f g h'
  end

  def change_tile_content(piece, column, row)
    @matrix[column][row] = piece
  end

  def print_line(line_number)
    print '║'
    if line_number.odd?
      8.times do |i|
        if @matrix[i][line_number] == 0
          i.even? ? (print '░'.on_white) : (print ' ')
        else
          print @matrix[i][line_number].token
        end
        print '│'
      end
    else
      8.times do |i|
        if @matrix[i][line_number] == 0
          i.even? ? (print " ") : (print '░'.on_white)
        else
          print @matrix[i][line_number].token
        end
        print '│'
      end
    end
    puts "\b║#{(line_number + 1)}"
  end
end

# puts '║░│ │░│ │░│ │░│ ║'
# puts '║♖│♘│♗│♕│♔│♗│♘│♖║'
# puts '║♙│♙│♙│♙│♙│♙│♙│♙║'
# puts '║♜│♞│♝│♛│♚│♝│♞│♜║'
# puts '║♟│♟│♟│♟│♟│♟│♟│♟║'

board = ChessBoard.new
board.print_board
