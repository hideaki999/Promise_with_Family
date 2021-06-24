class TasksController < ApplicationController

  def index
    @user = User.find(current_user.id)
  end

  def new
  end

  def edit
  end
end
