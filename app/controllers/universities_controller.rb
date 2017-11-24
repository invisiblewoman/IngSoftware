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
    
    if @cantidad == 0 
      if @university.save
      
        redirect_to universities_path(:condicion => 1)

      else
        render :new
      end
    else
      redirect_to universities_path(:condicion => 0)
    end
  end

  def update
  end

  def destroy
    @universidad=University.find(params[:id])
    @universidad.destroy
    redirect_to universities_path

  end
end
