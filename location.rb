# frozen_string_literal: true

# Class for an x,y coordinate
class Location
  attr_reader :x, :y

  def initialize(x_loc, y_loc)
    @x = x_loc
    @y = y_loc
  end

  def valid?
    return true if @x >= 1 && @x <= 8 && y >= 1 && y <= 8

    false
  end

  def to_s
    [@x, @y].to_s
  end
end
