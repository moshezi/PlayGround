require_relative 'board'
require_relative 'player'


class Game

  def initialize
    puts "---Welcome to Tic Tac Toe Game---"
    puts "Player 1, Please enter your name:"
    name_1 = gets.chomp
    @player_1 = Player.new(name_1, "X")
    puts "Player 2, Please enter your name:"
    name_2 = gets.chomp
    @player_2 = Player.new(name_2, "O")
    @current_player = @player_1
    @board = Board.new
  end

  def switch_players
    if @current_player == @player_1
          @current_player = @player_2
    else
      @current_player = @player_1
    end
  end

  def move
		puts "#{@current_player.name}, where do you want to make your move? (Enter a number from 1-9): "
		position = gets.chomp
		if position.to_i == @board.grid[position.to_i - 1]
			@board.grid[position.to_i - 1] = @current_player.marker
		else
			puts "This is not a valid move, please try again!: "
			switch_players
		end
	end

  def begin
		loop do
			@board.display
			move
			if game_over?
				break
			else
				switch_players
			end
		end
		@board.display
		if @board.win?
			puts "Game over! #{@current_player.name} won!"
		else
			puts "Game over! It's a draw!"
		end
	end

	def game_over?
		@board.win? ||
		@board.grid.all? {|cell| cell.is_a? String}
	end

end
