class TasksController < ApplicationController

  def index
    @tasks = Task.all
    @message = fight_message
  end

  def new
    @task = Task.new
    @message = fight_message
  end

  def create
    @message = fight_message
    @task = Task.new(task_prams)
    if @task.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def edit
    @message = fight_message
    @task = Task.find(params[:id])
  end

  def update
    @message = fight_message
    @task = Task.find(params[:id])
    if @task.update(task_prams)
      redirect_to action: :index
    else
      render action: :new
    end
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

  def fight_message
    message = ["今日も家族のために偉い！！！めっちゃ頑張ってるじゃん！",
               "今日も家族の為にありがとう！家族は最高に喜んでるよ！！",
               "一緒にやりましょう！せ～の (Ｉ・_・Ｉ) (Ｉ・_・Ｉ) (Ｉ・_・Ｉ) ヤァー！（だちょうクラブ）",
               "今日も頑張ってるね！内田の兄貴と同じくらい頑張ってるよ！",
               "(・∀・)ヽ耳がこう・・・(・∀・)３ゝでっかくなっちゃった！"]
    message.sample
  end
end
