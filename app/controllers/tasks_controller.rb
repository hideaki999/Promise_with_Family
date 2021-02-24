class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    Task.create(task_prams)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update(task_prams)
  end


  private

  def task_prams
    params.require(:task).permit(:title, :deadline_at, :families_id, :details).merge(user_id: 1,)
  end
end
