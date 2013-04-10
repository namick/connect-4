require 'spec_helper'

describe Board do
  let (:board) { Board.new }

  it "knows last drop coordinate" do
    board.drop(:x, 0)

    expect(board.last_x).to eq(0)
    expect(board.last_y).to eq(0)
  end

  it "knows the color of any coordinate" do
    board.drop(:red, 0)
    board.drop(:black, 4)
    board.drop(:red, 4)

    expect(board.color_of(0, 0)).to eq(:red)
    expect(board.color_of(4, 0)).to eq(:black)
    expect(board.color_of(4, 1)).to eq(:red)
    expect(board.color_of(5, 5)).to be_nil
  end
end
