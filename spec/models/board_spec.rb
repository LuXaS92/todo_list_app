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

  it "is invalid with a title longer than 255 characters" do
    board = Board.new(title: "a" * 256)
    board.valid?
    expect(board.errors[:title]).to include("is too long (maximum is 255 characters)")
  end

  it "can have many steps" do
    board = Board.create(title: "My Board")
    step1 = board.steps.create(title: "Step 1")
    step2 = board.steps.create(title: "Step 2")
    expect(board.steps).to include(step1, step2)
  end

  it "destroys associated steps when destroyed" do
    board = Board.create(title: "My Board")
    board.steps.create(title: "Step 1")
    expect { board.destroy }.to change { Step.count }.by(-1)
  end
end