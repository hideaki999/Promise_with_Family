class TasksController < ApplicationController
  # def index
  # end

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
