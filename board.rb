# frozen_string_literal: false

require_relative './space'
require_relative './knight'

# Chessboard class
class Board
  attr_accessor :x_size, :y_size, :piece

  def initialize(x_size, y_size)
    @x_size = x_size
    @y_size = y_size
  end

  def place_knight(x_loc, y_loc)
    @piece = Knight.new(x_loc, y_loc)
    @piece.generate_paths(@x_size, @y_size)
  end

  def knight_moves(start, target)
    place_knight(start[0], start[1])
    @piece.bfs(target)
  end
end

x = Board.new(4, 4)
x.place_knight(1, 1)
x.piece.pretty_print
puts x.knight_moves([1, 1], [4, 4])

p = Space.new(1, 1)
q = Space.new(2, 2)
p.predecessor = q

puts p.predecessor_list
