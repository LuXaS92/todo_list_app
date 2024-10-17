class TasksController < ApplicationController
  before_action :set_board
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = @board.tasks
  end

  def show
  end

  def new
    @task = @board.tasks.build
  end

  def edit
  end

  def create
    @task = @board.tasks.build(task_params)

    if @task.save
      redirect_to board_task_path(@board, @task), notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to board_task_path(@board, @task), notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to board_tasks_path(@board), notice: 'Task was successfully destroyed.'
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_task
    @task = @board.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :status)
  end
end