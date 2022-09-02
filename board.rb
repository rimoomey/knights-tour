# frozen_string_literal: true

require_relative './knight'

# Chessboard for Knights Travails
class Board
  attr_reader :history

  def initialize
    @history = []
  end

  def make_board(initial_piece, queue = [initial_piece])
    @history = []
    while queue.size.positive?
      piece = queue.pop
      piece.legal_moves.each do |move|
        next if @history.include?(move)

        child = piece.make_child(move)

        @history << move
        piece.children << child
        queue.append(child)
      end
    end
  end

  def knight_moves(initial_coordinates, target_coordinates)
    piece = Knight.new(initial_coordinates)
    make_board(piece)

    target = piece.bfs(target_coordinates, [piece]) 
    path = target.predecessor_tree

    print_result(path, path[0].coordinates, path[path.size - 1].coordinates)
  end

  def print_result(path, start, target)
    output = "Start: #{start}, End: #{target}\n" \
             "You made it in #{path.size - 1} steps!\n" \
             "Here's your path: \n"
    path.each_with_index do |knight, index|
      output += "#{knight.coordinates} => " unless (index + 1) == path.size
    end
    output += path[path.size - 1].coordinates.to_s
    puts output
  end
end

b = Board.new
b.knight_moves([1, 1], [3, 4])
b.knight_moves([1, 1], [8, 8])
