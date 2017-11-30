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
    
    @question_comment =  QuestionComment.find(params[:id])
    redirect_to question_path(@answer.question.id,:condicion => "0", :editar => "2", :idaq => params[:id] )
    
  end

  def update
     @question_comment =  QuestionComment.find(params[:id])
     @question_comment.update(texto: params[:QuestionComment][:texto])
     redirect_to question_path(params[:question_id],:condicion => "0", :editar => "0")
  end

  def destroy
  end
end
