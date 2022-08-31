# frozen_string_literal: false

require_relative './space'

# Chessboard class
class Board
  attr_accessor :space_graph, :x_size, :y_size

  def initialize(x_size, y_size)
    @x_size = x_size
    @y_size = y_size
    @space_graph = Space.new(1, 1)
    @space_graph.update_neighbors!(@x_size, @y_size)
  end
end

x = Board.new(8, 8)
p x
