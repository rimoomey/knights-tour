# frozen_string_literal: true

require_relative './space'

# Class to represent knight on a chess board.
class Piece
  attr_reader :location

  def initialize(coordinates)
    @location = Space.new(coordinates[0], coordinates[1])
    @location.visited = true
  end

  def move(new_location)
    new_location.predecessor = @location
    @location = new_location
    @location.visited = true
  end
end
