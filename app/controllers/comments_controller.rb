class CommentsController < ApplicationController
  def index
  end

  def show
  end

  

  def edit
  end

  def new
  
    @comment = Comment.new
    render :create
  end

  def create
    
    @comment = Comment.new(
      params.require(:comment)
        .permit(:texto,:answer_id,:question_id)
    )
    @comment.question_id = Answer.find(params[:answer_id]).question_id
    @comment.answer_id = params[:answer_id]
    @comment.user = current_user
    @comment.fecha = Time.now 
    @comment.save

    redirect_to question_path(Answer.find(params[:answer_id]).question_id)

  end

  def update
  end

  def destroy
  end
end
