class AnswersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @answer=Answer.new
  end

  def create
    @answer = Answer.new(
    params.require(:answer)
    .permit(:texto,:question)
    )
    @answer.user = current_user
    @answer.fecha = Time.now 
    if @answer.save
      redirect_to answers_path

    else
      redirect_to question_path(:id => "10")
    end

  end
  def edit
  end

  

  def update
  end

  def destroy
  end
end
