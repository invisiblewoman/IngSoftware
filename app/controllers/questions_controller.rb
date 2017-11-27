class QuestionsController < ApplicationController
	before_action :authenticate_user!,except:[:index,:show]
	def index
		@condicion = params[:condicion]
		if params[:buscar]
			@questions = Question.search(params[:buscar])
		else 
			@questions = Question.all
		end
	end
	def show
		@condicion = params[:condicion]
		@question = Question.find(params[:id])
	end 
	def destroy
	    question = Question.find(params[:id])
	    question.destroy
	    redirect_to monstruos_path
	end
	def new
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
		if @question.save
			if @question.tags.count > 5 then
				@question.destroy
				redirect_to questions_path(:condicion => 0)
			else
				redirect_to questions_path(:condicion => 1)
			end

		else
			render :new
		end
	end
	def bestAnswer

		@question=Question.find(params[:question])
		if current_user == @question.user
			if @question.user != Answer.find(params[:answer]).user
				@question.bestAnswer=params[:answer]
				@question.save
			end
		end
		redirect_to question_path(:id => @question.id,:condicion => "0")
	end
end