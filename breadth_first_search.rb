#frozen_string_literal: true

# Module to allow breadth first searching of knight paths
module BreadthFirstSearch
  def bfs(start, target, queue = [], path = [])
    new_path = path.dup.push(start)
    return new_path if new_path.include?(target)

    start.neighbors.each do |child|
      queue.unshift(child)
    end
    queue.pop

    queue.each do |child|
      path = bfs(child, target, queue, new_path)
    end
    nil
  end
end
