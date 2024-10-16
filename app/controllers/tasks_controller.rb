# app/controllers/tasks_controller.rb
class TasksController < ApplicationController
  before_action :set_board
  before_action :set_step
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks =task.all
  end

  def new
    @task = @step.tasks.new
  end

  def create
    @task = @step.tasks.new(task_params)
    if @task.save
      redirect_to [@board, @step], notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to [@board, @step], notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Tarefa foi deletada com sucesso.' }
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_step
    @step = @board.steps.find(params[:step_id])
  end

  def set_task
    @task = @step.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description)
  end
end