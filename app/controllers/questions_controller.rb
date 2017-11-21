class QuestionsController < ApplicationController
	before_action :authenticate_user!,except:[:index,:show]
	def index
		@condicion = params[:condicion]
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
		.permit(:cuerpo,:titulo,:university_id,tag_ids: [])
		)
		@question.user = current_user
		@question.fecha = Time.now 
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
end
