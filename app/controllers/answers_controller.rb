class AnswersController < ApplicationController
  before_action :authenticate_user!,except:[:create,:new]
  def index
  end

  def show
  end

  def new
    @answer=Answer.new
    render :create
  end

  def create
    @answer = Answer.new(
    params.require(:answer)
    .permit(:texto,:question_id)
    )
    @answer.question_id=10
    @answer.user = current_user
    @answer.fecha = Time.now 
    if @answer.save
      redirect_to question_path(@answer.question_id)

    else
      redirect_to question_path(:id => params[:answer[:question_id]])
    end

  end
  def edit
  end

  

  def update
  end

  def destroy
  end
end
