require_relative 'human'
require_relative 'computer'

class Game

  def initialize
    @number_of_turns = 0
  end


  def begin
    setup_players
    @maker.generate_password
    until @number_of_turns == 12 || @breaker.guess == @maker.password
      @breaker.try_to_guess(@maker.feedback)
        @maker.give_feedback(@breaker.guess)
        @number_of_dturns += 1
      end
      finish_game
    end


  def setup_players
    puts "Please choose(M) if you want to make or choose (B) if you want to break"
    answer = gets.chomp
    if answer.downcase == 'm'
      @maker = Human.new
      @breaker = Computer.new
    elsif answer.downcase == 'b'
      @maker = Computer.new
      @breaker = Human.new
    else
      puts "Wrong input, Please try again!"
      setup_players
    end
  end


    def finish_game
        if @breaker.guess == @maker.password
          puts "Correct! The password was broken in #{@number_of_turns} turns!"
          puts 'Codebreaker wins!'
        else
          puts 'Game over, Codebreaker failed to break the code!'
          puts "The correct answer was #{@maker.password}."
          puts 'Codemaker wins!'
        end
      end
    end

    Game.new.begin
