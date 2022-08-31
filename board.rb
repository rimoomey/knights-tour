# frozen_string_literal: false

require_relative './space'

# Chessboard class
class Board
  attr_accessor :space_graph, :x_max, :y_max

  def initialize
    @space_graph = Space.new(1, 1)
  end
end
