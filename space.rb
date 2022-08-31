# frozen_string_literal: true

# Class for an x,y coordinate
class Space
  attr_reader :x, :y, :neighbors

  def initialize(x_loc, y_loc)
    @x = x_loc
    @y = y_loc
    @neighbors = []
  end

  # def update_neighbors!(x_max, y_max)
  #   add_move(Space.new(@x - 1, @y - 2), x_max, y_max)
  #   add_move(Space.new(@x - 2, @y - 1), x_max, y_max)
  #   add_move(Space.new(@x - 2, @y + 1), x_max, y_max)
  #   add_move(Space.new(@x - 1, @y + 2), x_max, y_max)
  #   add_move(Space.new(@x + 1, @y + 2), x_max, y_max)
  #   add_move(Space.new(@x + 2, @y + 1), x_max, y_max)
  #   add_move(Space.new(@x + 2, @y - 1), x_max, y_max)
  #   add_move(Space.new(@x + 1, @y - 2), x_max, y_max)
  # end

  def add_move(new_loc, x_max, y_max)
    @neighbors.push(new_loc) if new_loc.valid?(x_max, y_max)
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
