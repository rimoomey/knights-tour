# frozen_string_literal: true

require_relative './piece'

# Polymorphic Knight class
class Knight < Piece
  attr_reader :moves

  def initialize(coordinates)
    super(coordinates)
    @legal_moves = moveset
  end

  def moveset
    result = []
    moves = [
      [-2, -1], [-2, 1], [-1, -2], [-1, 2],
      [2, -1], [2, 1], [1, -2], [1, 2]
    ]
    moves.each do |shift|
      move = [coordinates[0] + shift[0], coordinates[1] + shift[1]]
      result << move if move[0].between?(1, 8) && move[1].between?(1, 8)
    end
    result
  end
end

k = Knight.new([1, 1])
p k.coordinates
p k.moveset
