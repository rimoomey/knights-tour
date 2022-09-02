# frozen_string_literal: true

# Class to represent knight on a chess board.
class Piece
  attr_reader :coordinates, :children
  attr_accessor :predecessor

  def initialize(coordinates)
    @coordinates = coordinates
    @predecessor = nil
    @children = []
  end

  def bfs(coords, queue = [self])
    while queue.size.positive?
      current = queue.pop
      if coords == current.coordinates
        return current unless block_given?

        yield current
      end
      current.children.each do |child|
        queue.append(child)
      end
    end
  end

  def predecessor_tree(node = self)
    path = []
    until node.nil?
      path.push(node)
      node = node.predecessor
    end
    path.reverse
  end
end
