require 'pry'
SET = 0..7

# implements a vertex class, corresponding to a tile in the board, in order to implement the pieces movement graph
class Vertex
  attr_accessor :x_value, :y_value, :adjacency_list, :distance, :predecessor
  def initialize(x_coordinate, y_coordinate)
    @x_value = x_coordinate
    @y_value = y_coordinate
    @adjacency_list = []
    @distance = nil
    @predecessor = nil
  end

  def add_adjacent_vertex(vertex)
    @adjacency_list.push(vertex)
  end

  def print_vertex_adjacency_list
    puts "adjacency list length: #{@adjacency_list.length}"
    @adjacency_list.each do |vertex|
      puts "[#{vertex.x_value}, #{vertex.y_value}]"
    end
  end
end

class BoardGraph
  attr_accessor :tiles
  def initialize
    @tiles = []
    SET.each { |x_coordinate| SET.each { |y_coordinate| @tiles.push(Vertex.new(x_coordinate, y_coordinate)) } }
  end

  def find_tile(x_coordinate, y_coordinate)
    @tiles.find { |tile| tile.x_value == x_coordinate && tile.y_value == y_coordinate}
  end

  def bfs(root_vertex) # breadth first search
    queue = []
    root_vertex.distance = 0
    root_vertex.adjacency_list.each do |adj_vertex|
      adj_vertex.predecessor = root_vertex
      queue.push(adj_vertex)
    end
    until queue.empty?
      current_element = queue.shift
      current_element.distance = current_element.predecessor.distance + 1
      current_element.adjacency_list.each do |adj_vertex|
        if adj_vertex.distance.nil?
          adj_vertex.predecessor = current_element
          queue.push(adj_vertex)
        end
      end
    end
    root_vertex
  end

  def board_reset
    @tiles.each do |vertex|
      vertex.distance = nil
      vertex.predecessor = nil
    end
  end

  def print_distances
    @tiles.each do |tile|
      puts "[#{tile.x_value}, #{tile.y_value}] =====> #{tile.distance}"
    end
  end
end




