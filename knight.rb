# frozen_string_literal: true

require_relative './piece'

# Polymorphic Knight class
class Knight < Piece
  attr_reader :x_moves, :y_moves

  def initialize(x_coord, y_coord)
    super(x_coord, y_coord)
    @x_moves = [-2, -2, -1, -1, 1, 1, 2, 2]
    @y_moves = [1, -1, 2, -2, 2, -2, 1, -1]
  end

  def move(space)
    if valid_move?(space.x, space.y)
      super(space)
    else
      'Invalid movement'
    end
  end

  def valid_move?(x_coord, y_coord)
    @x_moves.each_with_index do |x, index|
      return true if (@space.x + x) == x_coord && @space.y + @y_moves[index] == y_coord
    end
    false
  end
end
