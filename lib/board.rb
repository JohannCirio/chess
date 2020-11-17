# ./lib/board.rb
require 'colorize'
# generates the game board and manipulates it's contents
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
    puts ' h g f e d c b a'
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
    puts "\b║#{line_number}"
  end
end

# puts '║░│ │░│ │░│ │░│ ║'
# puts '║♖│♘│♗│♕│♔│♗│♘│♖║'
# puts '║♙│♙│♙│♙│♙│♙│♙│♙║'
# puts '║♜│♞│♝│♛│♚│♝│♞│♜║'
# puts '║♟│♟│♟│♟│♟│♟│♟│♟║'

board = ChessBoard.new
white_pawn = Pawn.new('white')
board.change_tile_content(white_pawn, 0, 7)
board.change_tile_content(white_pawn, 1, 3)
board.print_board

