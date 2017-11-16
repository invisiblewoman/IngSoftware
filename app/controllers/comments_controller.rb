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
    @comment.question_id = params[:question_id]
    @comment.user = current_user
    @comment.fecha = Time.now 
    @comment.save

    redirect_to question_path(params[:question_id])

 

  end

  def update
  end

  def destroy
  end
end
