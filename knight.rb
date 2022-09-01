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

  def move(x_coord, y_coord)
    if valid_move?(x_coord, y_coord)
      super(x_coord, y_coord)
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

k = Knight.new(1, 2)
puts k.space
k.move(3, 3)
puts k.space
puts k.move(0, 0)
puts "#{k.space} \n\n"
puts k.historical_locations
