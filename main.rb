require_relative './board'

def start_game
  puts 'Input your starting location as an array as a comma-separated list (i.e. 1, 4): '
  start = gets.chomp.split(',')
  start = start.map(&:to_i)
  puts 'Input your ending location as an array as a comma-separated list (i.e. 1, 4): '
  finish = gets.chomp.split(',')
  finish = finish.map(&:to_i)

  b = Board.new
  b.knight_moves(start, finish)
end

start_game