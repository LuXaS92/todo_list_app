class TasksController < ApplicationController
  before_action :set_step
  before_action :set_task, only: [:edit, :update, :destroy]

  def new
    @task = @step.tasks.new
  end

  def create
    @task = @step.tasks.new(task_params)
    if @task.save
      redirect_to @step.board, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @step.board, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to @step.board, notice: 'Task was successfully destroyed.'
  end

  private

  def set_step
    @step = Step.find(params[:step_id])
  end

  def set_task
    @task = @step.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description)
  end
end