class VotesController < ApplicationController
	before_action :authenticate_user!
	def new
		@user=User.find(params[:user])
		@PuedeVotar=Permiso.where(nombre:"Votar",tipo:"Necesario").first
		@vote = Vote.new
		@vote.valor=params[:valor]
		@vote.votable_type=params[:tipo]
		@vote.votable_id=params[:id]
		@vote.user_id=@user.id
		@cantidad =Permiso.where(nombre:"Votar",tipo:"Ganancia").first.cantidad
		if @user.votos > @PuedeVotar.cantidad
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
							@QueEs.user.votos=@QueEs.user.votos + @cantidad	

						else
							if @QueEs.user.votos - @cantidad > 1 
								@QueEs.user.votos=@QueEs.user.votos - @cantidad	
							else
								@QueEs.user.votos = 1
							end
						end
						@votes[0].destroy
						@QueEs.user.save
						@vote.save
						redirect_to question_path(:id => params[:question],:condicion => "0")

					end
				else 
					if @vote.valor
						@QueEs.user.votos=@QueEs.user.votos + @cantidad			
					else
						if @QueEs.user.votos - @cantidad > 1 
								@QueEs.user.votos=@QueEs.user.votos - @cantidad	
						else
								@QueEs.user.votos = 1
						end
					end
					@QueEs.user.save
					@vote.save
					redirect_to question_path(:id => params[:question],:condicion => "0")
					
				end
			else
				redirect_to question_path(:id => params[:question],:condicion => "3")
			end
		else
			redirect_to question_path(:id => params[:question],:condicion => "4")
		end
	end
end
