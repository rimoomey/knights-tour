# frozen_string_literal: true

require_relative './location'

# Class to represent knight on a chess board.
class Knight
  attr_reader :location, :moves

  def initialize(location_x, location_y)
    @location = Location.new(location_x, location_y)
    @moves = []
    update_possible_moves
  end

  def to_s
    output = "Current Location: #{@location}\n" \
             "Available moves: \n#{@moves[0].to_s}"
    output += @moves[1..].reduce('') { |string, loc| string + ", " + loc.to_s} if @moves.size >= 1
    output
  end

  private

  def update_possible_moves
    add_move(Location.new(@location.x - 1, @location.y - 2))
    add_move(Location.new(@location.x - 2, @location.y - 1))
    add_move(Location.new(@location.x - 2, @location.y + 1))
    add_move(Location.new(@location.x - 1, @location.y + 2))
    add_move(Location.new(@location.x + 1, @location.y + 2))
    add_move(Location.new(@location.x + 2, @location.y + 1))
    add_move(Location.new(@location.x + 2, @location.y - 1))
    add_move(Location.new(@location.x + 1, @location.y - 2))
    nil
  end

  def add_move(new_loc)
    @moves.push(new_loc) if new_loc.valid?
    nil
  end
end

k1 = Knight.new(1, 1)
puts k1
