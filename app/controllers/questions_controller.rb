class QuestionsController < ApplicationController
	def index
	end
	def destroy
	    question = Question.find(params[:id])
	    question.destroy
	    redirect_to monstruos_path
	end
end
