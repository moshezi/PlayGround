class Computer

  attr_accessor :guess, :password, :sample, :feedback

  def initialize
    @guess = ''
    @password = ''
    @sample = [1,2,3,4,5,6]
    @feedback = Array.new(4)
  end

  def generate_password
    puts "Welcome to the Game!"
    4.times do
      @password += rand(1..6).to_s
    end
    puts 'The secret code is a 4-digit number containing digits from 1 to 6.'
    puts 'The computer will give you feedback on your guess:'
    puts "'!' means a correct number in the correct position."
    puts "'?' means a correct number, but in the wrong position."
    puts "'0' means that this number is not in the password."
  end

  def give_feedback(guess)
    @feedback = []
    temp_password = @password.chars.map(&:to_i)
    guess.chars.map(&:to_i).each_with_index do |val, ind|
      if val == temp_password[ind]
        @feedback << '!'
        temp_password[ind] = 'X'
      elsif temp_password.include?(val)
        @feedback << '?'
        temp_password[temp_password.index(val)] = 'X'
      else
        @feedback << '0'
      end
    end
    puts @feedback.join
  end

  def try_to_guess(feedback = %w(x x x x))
    feedback.each_with_index do |val, ind|
      if val == '!'
        next
      elsif val == '0' && !feedback.include?('?')
        @sample.delete(@guess[ind].to_i)
        @guess[ind] = @sample.sample.to_s
      else
        @guess[ind] = @sample.sample.to_s
      end
    end
    puts "The computer guesses #{@guess}."
  end
end
