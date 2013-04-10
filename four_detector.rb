class FourDetector
  def initialize(board)
    @board = board
  end

  def in_a_row?
    [:bar, :dash, :slash, :backslash].each do |axis|
      reset
      count_on axis
      return true if connect_four?
    end
    false
  end

  private

  def reset
    @connected = 1
  end

  def count_on(axis)
    send axis
  end

  def connect_four?
    @connected >= 4
  end

  def bar
    count :center, :down
  end

  def dash
    count :left, :center
    count :right, :center
  end

  def slash
    count :left, :up
    count :right, :down
  end

  def backslash
    count :up, :right
    count :down, :left
  end

  def count(x_direction, y_direction)
    @cursor = last_move
    @cursor.move(x_direction, y_direction)
    while @cursor.within_bounds?
      color_match ? @connected += 1 : break
      @cursor.move(x_direction, y_direction)
    end
  end

  def last_move
    Position.new(@board.last_x, @board.last_y)
  end

  def color_match
    @board.color_of(@cursor.x, @cursor.y) == @board.last_color
  end
end
