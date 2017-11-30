class PermisosController < ApplicationController
	before_action :authenticate_user!
	def index
		@user=current_user
		@permiso=Permiso.where(nombre: "Administrar").first
		if @user.votos < @permiso.cantidad
			redirect_to questions_path
		end
	end
	def update

		@parametro=params[:permiso]

		@user=User.find(@parametro[:user_id])
		@permiso=Permiso.find(@parametro[:permiso_id])
		@administrar=Permiso.where(nombre: "Administrar", tipo:"Necesario").first
		if @user.votos > @administrar.cantidad
			@permiso.cantidad=@parametro[:cantidad]
			@permiso.save
			
		end
		redirect_to permisos_path(@user)
		
	end
	def edit
	end
end
