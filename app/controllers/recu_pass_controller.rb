class RecuPassController < ApplicationController
  def recuperar
  end
  	def create 
		 flash[:notice]= "En breve recibirá un mail con los pasos para recuperar su contraseña"
		 redirect_to questions_path
	end
end
