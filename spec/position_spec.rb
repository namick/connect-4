require 'spec_helper'

describe Position do
  it "knows it's x boundry" do
    expect(Position.new(0, 0).within_bounds?).to be_true
    expect(Position.new(3, 0).within_bounds?).to be_true
    expect(Position.new(-1, 0).within_bounds?).to be_false
    expect(Position.new(8, 0).within_bounds?).to be_false
  end

  it "knows it's y boundry" do
    expect(Position.new(0, 0).within_bounds?).to be_true
    expect(Position.new(0, 3).within_bounds?).to be_true
    expect(Position.new(0, -1).within_bounds?).to be_false
    expect(Position.new(0, 8).within_bounds?).to be_false
  end

  it "moves up and right" do
    position = Position.new(0, 0)
    position.move :up, :right

    expect(position.x).to eq 1
    expect(position.y).to eq 1
  end

  it "moves around" do
    position = Position.new(5, 5)
    position.move :down, :left

    expect(position.x).to eq 4
    expect(position.y).to eq 4
  end
end
