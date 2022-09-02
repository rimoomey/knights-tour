# frozen_string_literal: true

# Class to represent knight on a chess board.
class Piece
  attr_reader :coordinates, :neighbors

  def initialize(coordinates)
    @coordinates = coordinates
    @neighbors = []
  end
end
