require_relative "source/player"
require_relative "source/methods"
include Methods

welcome
puts "Введите имя для Player 1:"
player1 = Player.new(gets.chomp)
puts "Введите имя для Player 2:"
player2 = Player.new(gets.chomp)
print_info(player1, player2)
while player1.health > 0 && player2.health > 0
  move_player(player1, player2)
  if player2.health == 0
    next
  end
  move_player(player2, player1)
end
who_winner(player1, player2)
