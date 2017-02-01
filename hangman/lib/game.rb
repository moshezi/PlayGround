
class Game

  def initialize
    @dictionary = []
    @progress = []
    @misses = []            #array for bad guess
    @guess = ''             #guess
    @guessed_letters = []   #array for good guess
  end

  # Display a menu for the player to start, load or exit the game
  def start_menu
    puts "Welcome, Please choose from the flowing options:"
    puts "N - new game"
    puts "L - load game"
    puts "E - exit"
    choice = gets.chomp.downcase

    case choice
    when 'n' then start_new_game
    when 'l' then load
    when 'e' then exit_game
    else
      puts "wrong input, please try again!"
      start_menu
    end
  end


 def load
    display_saved_games
    puts 'Please type the name of your game:'
    name = gets.chomp
    load_game(name)
  end

  def display_saved_games
    if Dir.glob('saves/*').empty?
      puts 'No saved games found!'
      start_menu
    else
      puts 'Found the following saves:'
      puts Dir.glob('saves/*').join("\n")
    end
  end

# Takes a name of a saved game object as an argument and loads the object.
def load_game(game)
  if File.exist?("saves/#{game}")
    loaded_game = Marshal.load(File.open("saves/#{game}", 'r'))
    loaded_game.game_loop
  else
    puts 'No game found with that name.'
    start_menu
  end
end


  def start_new_game
    load_dictionary
    pick_word
    game_loop
  end

  # Read the dictionary file, populate the dictionary array
  #   with all the words that match the requirements
  def load_dictionary
    File.open('5desk.txt', 'r').readlines.each do |line|
      @dictionary << line if line.strip.length.between?(5, 12)
    end
  end

  # Pick a random word from the dictionary for the player to guess
  def pick_word
    @word = @dictionary.sample.strip.downcase.split('')
  end

# Loop for displaying progress and guessing letters until the game ends.
  def game_loop
    loop do
      check_progress
      break if game_over?
      display_progress
      guess_letter
    end
    finish_game
  end

  # Give the user feedback on the result of the game.
  def finish_game
    if @progress == @word
      puts "You did it, the word was #{@word.join.upcase}! You win!!!"
    else
      puts "You lose, the correct word was #{@word.join.upcase}!"
    end
  end

  # Reset the progress array, repopulate the progress, misses and guessed
  # letters arrays according to the user's guess.
  def check_progress
    @progress = []
    @word.each do |letter|
      @progress << if letter == @guess || @guessed_letters.include?(letter)
        letter
      else
        '_'
      end
    end
    return if @guess == ''
    @word.include?(@guess) ? @guessed_letters << @guess : @misses << @guess
  end

  def game_over?
    @misses.size > 12 || @progress == @word
  end

# Display info about already guessed letters and number of wrong guesses left.
def display_progress
  puts @progress.join.upcase
  puts ""
  puts "Misses: #{@misses.join}"
  puts "You have #{13 - @misses.size} missed guesses left."
end

   # Prompt the user to enter a letter to guess, save or exit the game)
   def guess_letter
     puts 'Please guess a letter or you can also "save" or "exit" the game.'
     guess = gets.chomp.downcase
     case guess
     when 'save' then save_game
                      display_progress
                      guess_letter
    when 'exit' then exit_game
    else check_guess(guess)
    end
  end

  # Serializes the game object to a file with the chosen name.
 def save_game
   puts 'Enter a name for your saved game:'
   name = gets.chomp
   File.open("saves/#{name}", 'w').puts Marshal.dump(self)
   puts 'Game saved!'
 end

 # Check if the player's input is a valid guess(letter from a to z
 #   that hasn't been tried yet).
 def check_guess(guess)
   if @misses.include?(guess) || @progress.include?(guess)
     puts 'You have already tried that letter!'
     display_progress
     guess_letter
   elsif ('a'..'z').cover?(guess.downcase)
     @guess = guess
   else
     puts 'That is not a valid guess! Use single letters from a to z.'
     guess_letter
   end
 end

 def exit_game
   puts "thanks for playing ,goodbye!"
   exit
 end
end

Game.new.start_menu
