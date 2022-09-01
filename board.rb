# frozen_string_literal: false

require_relative './space'
require_relative './knight'

# Chessboard class
class Board
  attr_accessor :x_size, :y_size, :spaces, :piece

  def initialize(x_size, y_size)
    @x_size = x_size
    @y_size = y_size
    @spaces = make_spaces
    @piece = nil
  end

  def make_spaces
    spaces = []
    (1..x_size).each do |x|
      (1..y_size).each do |y|
        spaces.push(Space.new(x, y))
      end
    end
    spaces
  end

  def knight_moves(start, target, queue = [])
    @piece = Knight.new(start[0], start[1])
    queue.unshift(@piece.space)
    queue.push(@piece.space)

    path = bfs_move(target, queue)
    @spaces = make_spaces # reset board
    print_chain(path)
  end

  def bfs_move(target, queue = [])
    until queue.empty?
      current_space = queue.pop
      return predecessor_chain(current_space) if [current_space.x, current_space.y] == target

      @piece.x_moves.each_with_index do |x, index|
        new_x = @piece.space.x + x
        new_y = @piece.space.y + @piece.y_moves[index]
        if @spaces.include?(Space.new(new_x, new_y))
          new_space = @spaces.find { |el| Space.new(new_x, new_y) == el }
          unless new_space.visited == true
            @piece.move(new_space)
            queue.push(new_space)
          end
        end
      end
    end
  end

  def print_chain(predecessor_list)
    output = "You finished in #{predecessor_list.size} moves. \n"
    output += "Your path was: \n"
    predecessor_list.each do |predecessor|
      output += "#{predecessor} \n"
    end
    output
  end

  def predecessor_chain(space, path = [])
    return path if space.nil?

    predecessor_chain(space.predecessor, path)
    path.push(space)
  end
end

b = Board.new(8, 8)
puts b.knight_moves([2, 3], [6, 3])
puts b.knight_moves([2, 3], [5, 7])
puts b.knight_moves([2, 3], [2, 3])
