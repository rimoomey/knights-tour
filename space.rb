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
    if new_loc.valid?(x_max, y_max)
      @neighbors.push(new_loc)
      return
    end
    @neighbors.push(nil)
  end

  def valid?(x_max, y_max)
    @x >= 1 && @x <= x_max && y >= 1 && y <= y_max
  end

  def ==(other)
    @x == other.x && @y == other.y
  end

  def to_s
    [@x, @y].to_s
  end
end
