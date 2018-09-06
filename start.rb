require_relative "source/player"
require_relative "source/methods"
include Methods

@examples = read_examples

welcome

puts "Введите имя для Player 1:"
@player1 = Player.new(gets.chomp)

puts "Введите имя для Player 2:"
@player2 = Player.new(gets.chomp)

print_info

while @player1.health > 0 && @player2.health > 0
  move_player1
  if @player2.health == 0
    next
  end
  move_player2
end

who_winner
