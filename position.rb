class Position
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def within_bounds?
    @x <= 6 and @x >= 0 and @y <= 5 and @y >= 0
  end

  def move(x_direction, y_direction)
    send x_direction
    send y_direction
  end

  def up
    @y += 1
  end

  def down
    @y -= 1
  end

  def left
    @x -= 1
  end

  def right
    @x += 1
  end

  def center
    # noop
  end
end
