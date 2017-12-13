class ContactoMailer < ApplicationMailer
	def contact_send(params) 
		@parameters = mail(to:'educanding@mail.com', subject:params[:subject]) 
	end
end
