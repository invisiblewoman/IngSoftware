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
      @question = Question.find(params[:question_id])
      @cantidad = @question.answer.where(user: current_user).count
      @ganancia=Permiso.where(nombre:"Responder",tipo:"Ganancia").first.cantidad
    if @cantidad == 0
      @answer = Answer.new(
        params.require(:answer)
          .permit(:texto,:question_id)
      )
      @answer.question_id = params[:question_id]
      @answer.user = current_user
      @answer.fecha = Time.now 
      @answer.user.votos= @answer.user.votos + @ganancia
      @answer.user.save
      @answer.save
    end
      redirect_to question_path(params[:question_id],:condicion => "0", :editar => "0")

 

  end

  def edit
    
    @answer =  Answer.find(params[:id])
    
    @user=@answer.user
    @puede=Permiso.where(nombre: "Editar Respuesta",tipo:"Necesario").first.cantidad
    if @user.votos < @puede
      redirect_to question_path(@answer.question.id,:condicion => "6", :editar => "0") 
    else
      redirect_to question_path(@answer.question.id,:condicion => "0", :editar => "1", :ida => params[:id])
    end
  end

  def update
     @answer =  Answer.find(params[:id])
     @answer.update(texto: params[:answer][:texto])
     redirect_to question_path(params[:question_id],:condicion => "0", :editar => "0")
  end

  def destroy
  end
end
