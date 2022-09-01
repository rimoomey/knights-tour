# frozen_string_literal: true

require_relative './space'

# Class to represent knight on a chess board.
class Piece
  attr_reader :space, :historical_locations

  def initialize(x_coord, y_coord)
    @space = Space.new(x_coord, y_coord)
    @historical_locations = [@space]
  end

  def move(x_coord, y_coord)
    @space = Space.new(x_coord, y_coord)
    @historical_locations.push(@space)
  end
end
