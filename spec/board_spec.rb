require 'spec_helper'
require './board'

describe Board do
  let (:board) { Board.new }

  it "can drop a piece onto a column" do
    board.drop(:x, 0)

    expect(board.columns.first).to eq([:x])
  end

  it "detects a vertical win" do
    4.times { board.drop(:x, 0) }

    expect(board.winner?).to be_true
  end

  it "reports false for no vertical win" do
    expect(board.winner?).to be_false
  end

  it "detects a horizontal win" do
    4.times {|index| board.drop(:x, index) }

    expect(board.winner?).to be_true
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

    expect(board.winner?).to be_true
  end

  it "detects a down diagonal win" do
    board.drop(:o, 3)
    board.drop(:o, 2)
    board.drop(:o, 2)
    board.drop(:o, 1)
    board.drop(:o, 1)
    board.drop(:o, 1)

    board.drop(:x, 4)
    board.drop(:x, 2)
    board.drop(:x, 3)
    board.drop(:x, 1)

    expect(board.winner?).to be_true
  end

  it "stores last move" do
    board.drop(:o, 3)
    board.drop(:x, 3)
    board.drop(:o, 3)

    expect(board.last_move[:piece]).to eq(:o)
    expect(board.last_move[:column]).to eq(3)
    expect(board.last_move[:row]).to eq(2)
  end
end
