# frozen_string_literal: false

require_relative './space'
require_relative './knight'

# Chessboard class
class Board
  attr_accessor :x_size, :y_size, :piece

  def initialize(x_size, y_size)
    @x_size = x_size
    @y_size = y_size
  end

  def place_knight(x_loc, y_loc)
    @piece = Knight.new(x_loc, y_loc)
    @piece.update_neighbors!(@x_size, @y_size)
  end
end

x = Board.new(8, 8)
x.place_knight(4, 4)
puts x.piece.moves