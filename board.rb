# frozen_string_literal: false

require_relative './space'
require_relative './knight'

# Chessboard class
class Board
  attr_accessor :x_size, :y_size

  def initialize(x_size, y_size)
    @x_size = x_size
    @y_size = y_size
  end

  def knight_moves(start, target)
  end
end
