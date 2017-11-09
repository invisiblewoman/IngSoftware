class QuestionsController < ApplicationController
	def index
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
		params.require(:monstruo)
		.permit(:nombre)
		)
		if @question.save
			redirect_to monstruos_path
		else
			render :new
		end
	end
end
