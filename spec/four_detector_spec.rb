require 'spec_helper'

describe FourDetector do
  let (:board) { Board.new }
  let (:four) { FourDetector.new(board) }

  it "detects a vertical win" do
    4.times { board.drop(:purple, 0) }

    expect(four.in_a_row?).to be_true
  end

  it "detects a horizontal win" do
    4.times { |column| board.drop(:x, column) }

    expect(four.in_a_row?).to be_true
  end

  it "detects a up diagonal win" do
    board.drop(:o, 1)
    board.drop(:o, 2)
    board.drop(:o, 2)
    board.drop(:o, 3)
    board.drop(:o, 3)
    board.drop(:o, 3)

    board.drop(:x, 0)
    board.drop(:x, 2)
    board.drop(:x, 3)
    board.drop(:x, 1)

    expect(four.in_a_row?).to be_true
  end

  it "detects a down diagonal win" do
    board.drop(:o, 1)
    board.drop(:o, 1)
    board.drop(:o, 1)
    board.drop(:o, 2)
    board.drop(:o, 2)
    board.drop(:o, 3)

    board.drop(:x, 1)
    board.drop(:x, 2)
    board.drop(:x, 4)
    board.drop(:x, 3)

    expect(four.in_a_row?).to be_true
  end

  it "reports false for no win" do
    board.drop(:red, 0)

    expect(four.in_a_row?).to be_false
  end

  it "reports false for no win after many plays" do
    board.drop(:red, 0)
    board.drop(:black, 0)
    board.drop(:red, 0)
    board.drop(:black, 0)
    board.drop(:red, 0)
    board.drop(:black, 0)

    expect(four.in_a_row?).to be_false
  end

  it "reports false when three in a row" do
    board.drop(:red, 0)
    board.drop(:black, 1)
    board.drop(:red, 0)
    board.drop(:black, 1)
    board.drop(:red, 0)
    board.drop(:black, 1)

    expect(four.in_a_row?).to be_false
  end
end
