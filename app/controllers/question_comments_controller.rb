class QuestionCommentsController < ApplicationController
		before_action :authenticate_user!,except:[:create,:new]
  def index
  end

  def show
  end

  def new
  
    @question_comment = QuestionComment.new
    render :create
  end

  def create
    
    @question_comment = QuestionComment.new(
      params.require(:question_comment)
        .permit(:texto,:question_id)
    )
    @question_comment.question_id = params[:question_id]
    @question_comment.user = current_user
    @question_comment.fecha = Time.now 
    @question_comment.save
 
    redirect_to question_path(params[:question_id],:condicion => "0")

 

  end
  def edit
  end

  

  def update
  end

  def destroy
  end
end
