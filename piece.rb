# frozen_string_literal: true

require_relative './space'

# Class to represent knight on a chess board.
class Piece
  attr_reader :space, :historical_moves

  def initialize(x_coord, y_coord)
    @space = Space.new(x_coord, y_coord)
    @space.visited = true
  end

  def move(new_space)
    new_space.predecessor = @space
    @space = new_space
    @space.visited = true
  end
end
