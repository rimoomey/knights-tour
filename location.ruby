# frozen_string_literal: true

# Class for an x,y coordinate
class Location
  attr_reader :x, :y

  def initialize(x_loc, y_loc)
    @x = x_loc
    @y = y_loc
  end
end