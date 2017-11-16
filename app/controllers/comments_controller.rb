class CommentsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @comment=Comment.new
  end

  def edit
  end

  def create
    
    @comment = Comment.new(
      params.require(:comment)
        .permit(:texto,:question_id)
    )
    @comment.user = current_user
    @comment.question_id = params[:question_id]
    @comment.answer_id = 1
    @comment.fecha = Time.now 
    @comment.save
byebug
    redirect_to question_path(params[:question_id])

 

  end

  def update
  end

  def destroy
  end
end
