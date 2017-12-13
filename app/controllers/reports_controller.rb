class ReportsController < ApplicationController
	before_action :authenticate_user!
	def reportes
		@tipo = params[:tipo]
		@tipo_id = params[:tipo_id]
		
	end
	def new
		@report = Report.new
		@denuncia_id = params[:denuncia_id]
		@denuncia_tipo = params[:denuncia_tipo]
		@question_id = params[:question_id]

	end
	def create
		@report = Report.new(
		params.require(:report)
		.permit(:razon)
		)
		@parametro = params[:report]

		@report.user= current_user
		@report.reportable_id =@parametro[:denuncia_id]
		@report.reportable_type = @parametro[:denuncia_tipo]
	
		if @report.reportable_type == "Question" 
			@buscar=Question.find(@report.reportable_id)
			@cantidad = @buscar.reports.where(user_id: @report.user_id).count
		else
			if @report.reportable_type == "Answer" 
				@buscar=Answer.find(@report.reportable_id)
				@cantidad = @buscar.reports.where(user_id: @report.user_id).count
			else
				if @report.reportable_type == "AnswerComment" 
					@buscar=AnswerComment.find(@report.reportable_id)
					@cantidad = @buscar.reports.where(user_id: @report.user_id).count
				else
					@buscar=QuestionComment.find(@report.reportable_id)
					@cantidad = @buscar.reports.where(user_id: @report.user_id).count
				end
			end
		end
		if  @cantidad > 0
			redirect_to question_path(@parametro[:question_id],:condicion => "8", :editar => "0")
		else
			if @report.user == @buscar.user 
				redirect_to question_path(@parametro[:question_id],:condicion => "9", :editar => "0")
			else 
				if @report.save
						redirect_to question_path(@parametro[:question_id],:condicion => "0", :editar => "0")
					else
						render :new
				end
			end
		end
	end
end
