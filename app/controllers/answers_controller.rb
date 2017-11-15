class AnswersController < ApplicationController
  before_action :authenticate_user!,except:[:create,:new]
  def index
  end

  def show
  end

  def new
  
    @answer = Answer.new
    render :create
  end

  def create
    
    @answer = Answer.new(
      params.require(:answer)
        .permit(:texto,:question_id)
    )
    @answer.question_id = params[:question_id]
    @answer.user = current_user
    @answer.fecha = Time.now 
    @answer.save

    redirect_to question_path(params[:question_id])

 

  end
  def edit
  end

  

  def update
  end

  def destroy
  end
end
