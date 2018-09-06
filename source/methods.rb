require 'benchmark'

module Methods

  def welcome
    puts "----------------------------------------------"
    puts "------    Welcome to MathWars v. 1.0    ------"
    puts "----------------------------------------------"
  end

  def print_info
    puts "----------------------------------------------"
    puts "-- Player1: #{@player1.name}        Health: #{@player1.health}     "
    puts "----------------------------------------------"
    puts "-- Player2: #{@player2.name}        Health: #{@player2.health}     "
    puts "----------------------------------------------"
  end

  def read_examples
    abort("File ex.txt not found!") unless File.exist?("source/ex.txt")
    examples = File.readlines("source/ex.txt")
    examples.map! { |i| i.chomp }
    examples.map! {|i| i.split("$") }
  end

  def move_player1
    print "Player1: #{@player1.name}. У тебя есть 10 секунд на выстрел. Ты готов?"
    gets
    random_int = rand(0..(@examples.size - 1))
    print @examples[random_int][0] + " "
    time = Benchmark.measure { @answer = gets.chomp }
    seconds = time.real.to_i
    shot = (10 - seconds) + 10
    if @answer.to_i == @examples[random_int][1].to_i && seconds < 11
      puts "Точный выстрел! Ты выстрелил за #{seconds} сек. и нанес сопернику #{shot} урона!"
      @player2.wound(shot)
    elsif @answer.to_i == @examples[random_int][1].to_i && seconds > 10
      puts "Точно, но долго :( Ты целилися #{seconds} сек. и соперник успел спрятаться"
    else
      puts "Пуля прошла мимо. Правильный ответ: " + @examples[random_int][1]
    end
    gets
    print_info
  end

  def move_player2
    print "Player2: #{@player2.name}. Успей выстрелить за 10 секунд. Ты готов?"
    gets
    random_int = rand(0..(@examples.size - 1))
    print @examples[random_int][0] + " "
    time = Benchmark.measure { @answer = gets.chomp }
    seconds = time.real.to_i
    shot = (10 - seconds) + 10
    if @answer.to_i == @examples[random_int][1].to_i && seconds < 11
      puts "Прямо в цель! Ты выстрелил за #{seconds} сек. и нанес сопернику #{shot} урона!"
      @player1.wound(shot)
    elsif @answer.to_i == @examples[random_int][1].to_i && seconds > 10
      puts "Точный выстрел, но долго :( Ты целилися #{seconds} сек. и соперник успел спрятаться"
    else
      puts "Рука дрогнула и пуля прошла мимо. Правильный ответ: " + @examples[random_int][1]
    end
    gets
    print_info
  end

  def who_winner
    if @player1.health == 0
      puts "----------------------------------------------"
      puts "-- Player1: #{@player1.name}       WINNER     "
      puts "----------------------------------------------"
    else
      puts "----------------------------------------------"
      puts "-- Player2: #{@player2.name}       WINNER     "
      puts "----------------------------------------------"
    end
  end

end