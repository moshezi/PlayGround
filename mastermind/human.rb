class Human
  attr_accessor :password, :guess, :feedback

  def initialize
    @guess = ''
    @password = ''
    @feedback = %w(x x x x)  #same as ['x','x','x','x']
  end

  def generate_password
    puts 'Create a code and see if the computer can break it!'
    puts 'The code is a number containing four digits, each between 1 and 6.'
    input = gets.chomp
    if input.chars.map(&:to_i).all? { |i| i.between?(1, 6) } && input.size == 4
      @password = input
    else
      puts 'This is not a valid code, try again!'
      generate_password
    end
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
      else
        @feedback << '0'
      end
    end
    puts "The computer gets feedback: #{@feedback.join}"
  end


  def try_to_guess(*)
    puts 'Try to guess the code!:'
    input = gets.chomp
    if input.size == 4 && input.chars.map(&:to_i).all? { |d| d.between?(1, 6) }
      @guess = input
    else
      puts 'This is not a valid guess, try again!'
      try_to_guess
    end
  end


end
