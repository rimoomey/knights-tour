# frozen_string_literal: true

# Class for an x,y coordinate
class Space
  attr_accessor :x, :y, :visited

  def initialize(x_loc, y_loc)
    @x = x_loc
    @y = y_loc
    @visited = false
  end

  def valid?(x_max, y_max)
    @x >= 1 && @x <= x_max && y >= 1 && y <= y_max
  end

  def ==(other)
    @x == other.x && @y == other.y
  end

  def to_a
    [@x, @y]
  end

  def to_s
    [@x, @y].to_s
  end
end
