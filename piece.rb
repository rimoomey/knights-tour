# frozen_string_literal: true

# Class to represent knight on a chess board.
class Piece
  attr_reader :space

  def initialize(x_coord, y_coord)
    @space = Space.new(x_coord, y_coord)
  end
end
