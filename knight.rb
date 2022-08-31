# frozen_string_literal: true

require_relative './space'

# Class to represent knight on a chess board.
class Piece
  attr_reader :space

  def initialize(starting_space)
    @space = starting_space
  end
end

class Knight < Piece
end
