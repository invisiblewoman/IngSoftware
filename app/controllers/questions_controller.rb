class QuestionsController < ApplicationController
	before_action :authenticate_user!,except:[:index]
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
		params.require(:question)
		.permit(:cuerpo,:titulo,tag_ids: [])
		)
		@question.user = current_user 
		if @question.save
			redirect_to questions_path

		else
			render :new
		end
	end
end
