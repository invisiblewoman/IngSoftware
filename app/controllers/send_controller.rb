class SendController < ApplicationController
	def index
	end

	def create 
		@params= params
 		ContactoMailer.contact_send(params).deliver
		 flash[:notice]= "Mail Enviado"
		 redirect_to questions_path
	end

	
end
