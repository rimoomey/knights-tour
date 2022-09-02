# frozen_string_literal: true

require_relative './piece'

# Polymorphic Knight class
class Knight < Piece
  attr_reader :location, :moves, :neighbors

  def initialize(coordinates)
    super(coordinates)
    @moves = moveset
    @neighbors = []
  end

  def moveset
    moves = [
      [-2, -1], [-2, 1], [-1, -2], [-1, 2],
      [2, -1], [2, 1], [1, -2], [1, 2]
    ]

    moves.map do |shift|
      coordinates + shift
    end
  end
end

k = Knight.new([1, 1])