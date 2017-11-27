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
		if @question.save
			if @question.tags.count > 5 then
				@question.destroy
				redirect_to new_question_path(condicion: 0)
			else
				redirect_to questions_path
			end

		else
			render :new
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

end

