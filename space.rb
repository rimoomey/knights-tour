# frozen_string_literal: true

require_relative './breadth_first_search'

# Class for an x,y coordinate
class Space
  include BreadthFirstSearch

  attr_accessor :x, :y, :neighbors, :predecessor

  def initialize(x_loc, y_loc, predecessor = nil)
    @x = x_loc
    @y = y_loc
    @predecessor = predecessor
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

  def to_a
    [@x, @y]
  end

  def to_s
    [@x, @y].to_s
  end
end
