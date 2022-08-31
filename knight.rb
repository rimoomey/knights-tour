# frozen_string_literal: true

require_relative './space'

# Class to represent knight on a chess board.
class Piece
  attr_reader :space

  def initialize(x_coord, y_coord)
    @space = Space.new(x_coord, y_coord)
  end
end

# Polymorphic Knight piece
class Knight < Piece
  def moves
    @space.neighbors
  end

  def update_neighbors!(x_max, y_max)
    @space.add_move(Space.new(@space.x - 1, @space.y - 2), x_max, y_max)
    @space.add_move(Space.new(@space.x - 2, @space.y - 1), x_max, y_max)
    @space.add_move(Space.new(@space.x - 2, @space.y + 1), x_max, y_max)
    @space.add_move(Space.new(@space.x - 1, @space.y + 2), x_max, y_max)
    @space.add_move(Space.new(@space.x + 1, @space.y + 2), x_max, y_max)
    @space.add_move(Space.new(@space.x + 2, @space.y + 1), x_max, y_max)
    @space.add_move(Space.new(@space.x + 2, @space.y - 1), x_max, y_max)
    @space.add_move(Space.new(@space.x + 1, @space.y - 2), x_max, y_max)
  end
end
