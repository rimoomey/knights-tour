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
    @piece.generate_paths(@x_size, @y_size)
    @piece.reset
  end
end

x = Board.new(3, 3)
x.place_knight(1, 1)
x.piece.pretty_print
