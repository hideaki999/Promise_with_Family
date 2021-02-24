class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    binding.pry
  end

  def edit
    @task = Task.new
  end
end
