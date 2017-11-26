class VotesController < ApplicationController
	before_action :authenticate_user!
	def new
		@user=User.find(params[:user])
		@vote = Vote.new
		@vote.valor=params[:valor]
		@vote.votable_type=params[:tipo]
		@vote.votable_id=params[:id]
		@vote.user_id=@user.id
		if @vote.votable_type == "Question"
			@QueEs= Question.find(@vote.votable_id)
		else
			if @vote.votable_type == "Answer"
				@QueEs= Answer.find(@vote.votable_id)
			else
				if @vote.votable_type == "AnswerComment"
					@QueEs= AnswerComment.find(@vote.votable_id)
				else
					@QueEs= QuestionComment.find(@vote.votable_id)
				end
			end
		end
		if @QueEs.user != @user then
			@votes=@QueEs.votes.where(user_id: @user.id)
			if @votes.count != 0 
				
				if @votes[0].valor == @vote.valor 
					if @vote.valor
						redirect_to question_path(:id => params[:question],:condicion => "1")
					else
						redirect_to question_path(:id => params[:question],:condicion => "2")
					end
				else
					if @vote.valor
						@QueEs.user.votos=@QueEs.user.votos+1		
					else
						if @QueEs.user.votos != 1 
							@QueEs.user.votos=@QueEs.user.votos-1
						end
					end
					@votes[0].destroy
					@QueEs.user.save
					@vote.save
					redirect_to question_path(:id => params[:question],:condicion => "0")
				end
			else 
				if @vote.valor
					@QueEs.user.votos=@QueEs.user.votos+1		
				else
					if @QueEs.user.votos != 1 
							@QueEs.user.votos=@QueEs.user.votos-1
					end
				end
				@QueEs.user.save
				@vote.save
				redirect_to question_path(:id => params[:question],:condicion => "0")
				
			end
		else
			redirect_to question_path(:id => params[:question],:condicion => "3")
		end
		
	end
end
