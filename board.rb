class Board
  attr_reader :columns
  attr_reader :last_move

  def initialize
    @columns = []
    7.times do
      @columns << []
    end
  end

  def drop(piece, column_index)
    @columns[column_index] << piece
    @last_move = {
      piece: piece,
      column: column_index,
      row: @columns[column_index].length - 1
    }
  end

  def winner?
    return false unless @last_move
    return true if winner_horizontal?
    return true if winner_vertical?
    return true if winner_up_diagonal?
    return true if winner_down_diagonal?

    false
  end

  private
  def winner_up_diagonal?
    directional_count(column: -1, row: -1) + directional_count(column: +1, row: +1) >= 3
  end

  def winner_down_diagonal?
    directional_count(column: -1, row: +1) + directional_count(column: +1, row: -1) >= 3
  end

  def winner_vertical?
    directional_count(column: 0, row: -1) >= 3
  end

  def winner_horizontal?
    directional_count(column: -1, row: 0) + directional_count(column: +1, row: 0) >= 3
  end

  def directional_count(direction)
    count = 0
    cursor = move_cursor(@last_move, direction)

    while within_bounds?(cursor)
      piece = @columns[cursor[:column]][cursor[:row]]
      if piece == @last_move[:piece]
        count += 1
      else
        return count
      end
      cursor = move_cursor(cursor, direction)
    end
    count
  end

  def move_cursor(cursor, direction)
    {
      row: cursor[:row] + direction[:row],
      column: cursor[:column] + direction[:column]
    }
  end

  def within_bounds?(cursor)
    return false if cursor[:column] > 6
    return false if cursor[:column] < 0
    return false if cursor[:row] > 5
    return false if cursor[:row] < 0
    true
  end
end
