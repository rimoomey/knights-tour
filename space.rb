# frozen_string_literal: true

# Class for an x,y coordinate
class Space
  attr_reader :x, :y, :neighbors

  def initialize(x_loc, y_loc)
    @x = x_loc
    @y = y_loc
    @neighbors = []
  end

  def add_child(new_loc, x_max, y_max)
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
