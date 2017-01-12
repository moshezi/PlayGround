class Board
  
  attr_accessor :grid

  def initialize
    @grid = [1,2,3,4,5,6,7,8,9]
  end

  def display
    puts "#{@grid[0..2].join(" | ")}"
    puts "---------"
    puts "#{@grid[3..5].join(" | ")}"
    puts "---------"
    puts "#{@grid[6..8].join(" | ")}"
  end

=begin

winning conditions
  Horizontal
		[0, 1, 2], [3, 4, 5], [6, 7, 8],
	Vertical
		[0, 3, 6], [1, 4, 7],[2, 5, 8],
	Diagonal
		[0, 4, 8], [2, 4, 6]

=end

    def win?
      grid[0] == grid[1] && grid[1] == grid[2] ||
      grid[3] == grid[4] && grid[4] == grid[5] ||
      grid[6] == grid[7] && grid[7] == grid[8] ||
      grid[0] == grid[3] && grid[3] == grid[6] ||
      grid[1] == grid[4] && grid[4] == grid[7] ||
      grid[2] == grid[5] && grid[5] == grid[8] ||
      grid[0] == grid[4] && grid[4] == grid[8] ||
      grid[2] == grid[4] && grid[4] == grid[6]
    end
end
