class AnswerCommentsController < ApplicationController
	before_action :authenticate_user!,except:[:create,:new]
  def index
  end

  def show
  end

  def new
  
    @answerComment = AnswerComment.new
    render :create
  end

  def create
    
    @answerComment = AnswerComment.new(
      params.require(:answer_comment)
        .permit(:texto,:answer_id)
    )
    @answerComment.answer_id = params[:answer_id]
    @answerComment.user = current_user
    @answerComment.fecha = Time.now 
    @answerComment.save
 
    redirect_to question_path(Answer.find(params[:answer_id]).question.id,:condicion => "0")

 

  end
  def edit
  end

  

  def update
  end

  def destroy
  end
end
