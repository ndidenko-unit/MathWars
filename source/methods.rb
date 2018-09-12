require 'benchmark'
module Methods
  def welcome
    puts "----------------------------------------------"
    puts "------    Welcome to MathWars v. 1.0    ------"
    puts "----------------------------------------------"
  end

  def print_info(player1, player2)
    puts "----------------------------------------------"
    puts "-- Player1: #{player1.name}        Health: #{player1.health}     "
    puts "----------------------------------------------"
    puts "-- Player2: #{player2.name}        Health: #{player2.health}     "
    puts "----------------------------------------------"
  end

  def create_example
      number1 = rand(0..99)
      sign1 = rand(0..1)
      number2 = rand(0..99)
      sign2 = rand(0..1)
      number3 = rand(0..99)
      if sign1 == 0
        result = number1 + number2
        sign1 = " + "
      else
        result = number1 - number2
        sign1 = " - "
      end
      if sign2 == 0
        result += number3
        sign2 = " + "
      else
        result -= number3
        sign2 = " - "
      end
      print "#{number1}#{sign1}#{number2}#{sign2}#{number3} = "
     result
  end

  def move_player (player1, player2)
    print "Player: #{player1.name}. У тебя есть 10 секунд на выстрел. Ты готов?"
    gets
    result = create_example
    time = Benchmark.measure { @answer = gets.chomp }
    seconds = time.real.to_i
    shot = (10 - seconds) + 10
    if @answer.to_i == result && seconds < 11
      puts "Точный выстрел! Ты выстрелил за #{seconds} сек. и нанес сопернику #{shot} урона!"
      player2.wound(shot)
    elsif @answer.to_i == result && seconds > 10
      puts "Точно, но долго :( Ты целилися #{seconds} сек. и соперник успел спрятаться"
    else
      puts "Пуля прошла мимо. Правильный ответ: " + result.to_s
    end
    gets
    print_info(player1, player2)
  end

  def who_winner(player1, player2)
    if player1.health == 0
      puts "----------------------------------------------"
      puts "-- Player1: #{player1.name}       WINNER     "
      puts "----------------------------------------------"
    else
      puts "----------------------------------------------"
      puts "-- Player2: #{player2.name}       WINNER     "
      puts "----------------------------------------------"
    end
  end

end