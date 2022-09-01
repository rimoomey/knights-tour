# frozen_string_literal: true

require_relative './space'

# Class to represent knight on a chess board.
class Piece
  attr_reader :space, :space_list

  def initialize(x_coord, y_coord)
    @space = Space.new(x_coord, y_coord)
    @space_list = []
  end

  def reset
    @space_list = []
  end
end

# Polymorphic Knight piece
class Knight < Piece
  def moves
    @space.neighbors
  end

  def update_paths(x_max, y_max, path = @space)
    path.add_child(Space.new(path.x - 1, path.y - 2), x_max, y_max)
    path.add_child(Space.new(path.x - 2, path.y - 1), x_max, y_max)
    path.add_child(Space.new(path.x - 2, path.y + 1), x_max, y_max)
    path.add_child(Space.new(path.x - 1, path.y + 2), x_max, y_max)
    path.add_child(Space.new(path.x + 1, path.y + 2), x_max, y_max)
    path.add_child(Space.new(path.x + 2, path.y + 1), x_max, y_max)
    path.add_child(Space.new(path.x + 2, path.y - 1), x_max, y_max)
    path.add_child(Space.new(path.x + 1, path.y - 2), x_max, y_max)
  end

  def generate_paths(x_max, y_max, path = @space, distance = 0)
    return if path.nil?
    return if @space_list.include?([path.x, path.y])
    return unless path.valid?(x_max, y_max)

    @space_list.push([path.x, path.y])

    update_paths(x_max, y_max, path)
    path.neighbors.each do |neighbor|
      generate_paths(x_max, y_max, neighbor, distance + 1)
    end
  end

  def pretty_print(path = @space, print_queue = [path])
    return if path.nil?
    return if path.neighbors.empty?
    return if @space_list.include?([path.x, path.y])

    print_space(path)
    @space_list.push([path.x, path.y])
    queue(path, print_queue)
    print_queue.pop

    print_queue.each do |el|
      pretty_print(el, print_queue)
    end
  end

  def print_space(curr_space = @space)
    output = "#{curr_space} => "
    curr_space.neighbors.each do |neighbor|
      output += "#{neighbor} \n \t  " unless neighbor.nil?
    end
    puts output
  end

  def queue(path = @space, queue = [])
    path.neighbors.each do |neighbor|
      queue.unshift(neighbor)
    end
  end
end
