# frozen_string_literal: true

# Class to represent knight on a chess board.
class Knight
  attr_reader :location, :moves

  def initialize(location)
    @location = location
  end
end
