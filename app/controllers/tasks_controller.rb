class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_prams)
    if @task.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update(task_prams)
    redirect_to action: :index
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to action: :index
  end


  private

  def task_prams
    params.require(:task).permit(:title, :deadline_at, :families_id, :details).merge(user_id: 1)
  end
end
