require './board'
require './four_detector'
require './position'

class Game
  def initialize
    @board = Board.new
  end

  def start
    print_board
    [:x, :o].cycle do |player|
      ask_for_move(player)
      print_board
      if @board.winner?
        puts "Player #{player} won!"
        break
      end
    end
  end

  def print_board
    puts " | " + (0..6).to_a.join(' | ') + " |"
    (0..5).to_a.reverse.each do |row|
      @board.grid.each do |column|
        print_position(column[row])
      end
      print " | \n"
    end
    puts " ______________________________"
  end

  def print_position(position)
    print " | #{position || ' '}"
  end

  def ask_for_move(player)
    puts "Player #{player} - make your move..."
    column = gets.chomp
    @board.drop player, column.to_i
  end

end

Game.new.start
