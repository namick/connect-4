class Board
  attr_reader :grid, :last_color, :last_x, :last_y

  def initialize
    @grid = Array.new(7) { [] }
  end

  def drop(color, column)
    @grid[column] << color
    @last_x = column
    @last_y = @grid[column].length - 1
    @last_color = color
  end

  def color_of(x, y)
    @grid[x][y]
  end

  def winner?
    four = FourDetector.new(self)
    four.in_a_row?
  end
end
