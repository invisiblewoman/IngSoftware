class QuestionsController < ApplicationController
	before_action :authenticate_user!,except:[:index,:show]
	def index
		
		if params[:buscar]
			@questions = Question.search(params[:buscar])
		else 
			@questions = Question.all
		end
	end
	def show
		@condicion = params[:condicion]
		@editar = params[:editar]
		@question = Question.find(params[:id])
		@question.update(visitas:@question.visitas+1)
	end 
	def destroy
	    question = Question.find(params[:id])
	    question.destroy
	    redirect_to questions_path
	end
	def new
		@condicion = params[:condicion]
		@question = Question.new
	end
	def create
		
		@question = Question.new(
		params.require(:question)
		.permit(:cuerpo,:titulo,:university_id,tag_ids: [])
		)
		@question.user = current_user
		@question.fecha = Time.now 
		@question.bestAnswer = 0
		@ganancia=Permiso.where(nombre:"Preguntar",tipo:"Ganancia").first.cantidad
		
		if @question.tags.length > 5 then
			redirect_to new_question_path(condicion: 0)
		else 
			if @question.save
				@question.user.votos = @question.user.votos + @ganancia
				@question.user.save
				redirect_to questions_path
			else
				render :new
			end
		end
	end


	def tinymce(config=:default, options={})
 		 javascript_tag { tinymce_javascript(config, options) }
	end
	
	def edit
		@question = Question.find(params[:id])
	end

	def update
		@question = Question.find(params[:id])
		
		@question.update(titulo: params[:question][:titulo], 
					cuerpo: params[:question][:cuerpo], 
					tag_ids: params[:question][:tag_ids],
					university_id: params[:question][:university_id]
					)
		redirect_to question_path(@question.id,:condicion => "0", :editar => "0")

	end

	def bestAnswer

		@question=Question.find(params[:question])
		@answer= Answer.find(params[:answer])
		if current_user == @question.user
			if @question.user != @answer.user
				@question.bestAnswer=params[:answer]
				@ganancia=Permiso.where(nombre:"Mejor Respuesta",tipo:"Ganancia").first.cantidad
				@answer.user.votos = @answer.user.votos + @ganancia
				@question.save
			end
		end
		redirect_to question_path(:id => @question.id,:condicion => "0")
	end
	def masvisitadas

	end
end

