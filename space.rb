# frozen_string_literal: true

# Class for an x,y coordinate
class Space
  attr_accessor :visited, :predecessor
  attr_reader :x, :y, :neighbors

  def initialize(x_loc, y_loc)
    @x = x_loc
    @y = y_loc
    @neighbors = []
    @visited = false
    @predecessor = nil
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
