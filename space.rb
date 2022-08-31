# frozen_string_literal: true

# Class for an x,y coordinate
class Space
  attr_reader :x, :y, :neighbors
  attr_accessor :piece

  def initialize(x_loc, y_loc)
    @x = x_loc
    @y = y_loc
    @neighbors = []
  end

  def update_neighbors
    add_move(Space.new(@x - 1, @y - 2))
    add_move(Space.new(@x - 2, @y - 1))
    add_move(Space.new(@x - 2, @y + 1))
    add_move(Space.new(@x - 1, @y + 2))
    add_move(Space.new(@x + 1, @y + 2))
    add_move(Space.new(@x + 2, @y + 1))
    add_move(Space.new(@x + 2, @y - 1))
    add_move(Space.new(@x + 1, @y - 2))
  end

  def add_move(new_loc)
    @neighbors.push(new_loc) if new_loc.valid?
    nil
  end

  def valid?(x_max, y_max)
    return true if @x >= 1 && @x <= x_max && y >= 1 && y <= y_max

    false
  end

  def to_s
    [@x, @y].to_s
  end
end
