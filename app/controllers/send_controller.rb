class SendController < ApplicationController
	def index
	end

	def create 
		 flash[:notice]= "Mail Enviado"
		 redirect_to questions_path
	end

	
end
