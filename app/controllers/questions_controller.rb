class QuestionsController < ApplicationController
	before_action :authenticate_user!,except:[:index,:show]
	def index
	end
	def show
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
		.permit(:cuerpo,:titulo,tag_ids: []))
		@question.user = current_user
		@question.fecha = Time.now 
		if @question.save
			redirect_to questions_path

		else
			render :new
		end
	end
end
