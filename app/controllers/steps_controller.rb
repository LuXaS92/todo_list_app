class StepsController < ApplicationController
  before_action :set_board
  before_action :set_step, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @step = @board.steps.new
  end

  def create
    @step = @board.steps.new(step_params)
    if @step.save
      redirect_to @board, notice: 'Step was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @step.update(step_params)
      redirect_to @board, notice: 'Step was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @step.destroy
    redirect_to @board, notice: 'Step was successfully destroyed.'
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_step
    @step = @board.steps.find(params[:id])
  end

  def step_params
    params.require(:step).permit(:title)
  end
end