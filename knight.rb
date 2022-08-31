# frozen_string_literal: true

require_relative './location'

# Class to represent knight on a chess board.
class Knight
  attr_reader :location, :moves

  def initialize(location_x, location_y)
    @location = location.new(location_x, location_y)
    @moves = generate_moves
  end

  def generate_moves
    move_array = []
    move_array.push(location.new(@location.x - 1, @location.y - 2))
    move_array.push(location.new(@location.x - 2, @location.y - 1))
    move_array.push(location.new(@location.x - 2, @location.y + 1))
    move_array.push(location.new(@location.x - 1, @location.y + 2))
    move_array.push(location.new(@location.x + 1, @location.y + 2))
    move_array.push(location.new(@location.x + 2, @location.y + 1))
    move_array.push(location.new(@location.x + 2, @location.y - 1))
    move_array.push(location.new(@location.x + 1, @location.y - 2))
    move_array
  end
end
