class UniversitiesController < ApplicationController
before_action :authenticate_user!
  def index
    @condicion = params[:condicion]
  end

  def show
    @university=University.find(params[:id])
  end
  def new
    @university= University.new
  end
  def seguidos
    @condicion = params[:condicion] 
    @usuario=User.find(current_user.id)
    @seguidos=@usuario.universities.all
  end
  def follow
    @universidad=University.find(params[:id])
    @condicion=1
    current_user.universities.all.each do |seguidos| 
      if seguidos.nombre == @universidad.nombre 
        @condicion = 0
      end
    end
    if @condicion != 0 then
      current_user.universities.push(@universidad)  
    end
    redirect_to seguidos_university_path(current_user,:condicion => @condicion)
  end
  def unfollow
    @universidad=University.find(params[:id])
    @rompio=0
    University.all do |universidades| 
      if universidades.nombre == @universidad.nombre 
        @rompio = 1
      end
    end
    if @rompio == 0 then
      current_user.universities.delete(@universidad)  
    end
    redirect_to seguidos_university_path(current_user,:condicion => "1")
  end

  def edit
  end

  def create
    @university = University.new(
    params.require(:university)
    .permit(:nombre,:ubicacion,:tipo)
    )
    @cantidad=University.where(nombre: @university.nombre).count
    @puede=Permiso.where(nombre:"Crear Facultad",tipo:"Necesario").first.cantidad
    @ganancia=Permiso.where(nombre:"Crear Facultad",tipo:"Ganancia").first.cantidad
     if current_user.votos > @puede
      if @cantidad == 0 
        if @university.save
          current_user.votos= current_user.votos + @ganancia
          current_user.save
          redirect_to universities_path(:condicion => 1)

        else
          render :new
        end
      else
        redirect_to universities_path(:condicion => 0)
      end
    else
      redirect_to universities_path(:condicion => 2)
    end
  end

  def update
  end

  def destroy
    @puede=Permiso.where(nombre:"Eliminar Facultad",tipo:"Necesario").first.cantidad
    @ganancia=Permiso.where(nombre:"Eliminar Facultad",tipo:"Ganancia").first.cantidad
    if current_user.votos > @puede 
      @universidad=University.find(params[:university_id])
      @universidad.destroy
      current_user.votos= current_user.votos + @ganancia
      current_user.save
      redirect_to universities_path(:condicion => 1)
    else
      redirect_to universities_path(:condicion => 3)
    end
  end
end
