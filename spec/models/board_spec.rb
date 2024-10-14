require 'rails_helper'

RSpec.describe Board, type: :model do
  it "is valid with a title" do
    board = Board.new(title: "My Board")
    expect(board).to be_valid
  end

  it "is invalid without a title" do
    board = Board.new(title: nil)
    board.valid?
    expect(board.errors[:title]).to include("can't be blank")
  end
end