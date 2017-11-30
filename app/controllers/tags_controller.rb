class TagsController < ApplicationController
  before_action :authenticate_user!
  def index
    @condicion = params[:condicion ]
  end

  def show
    @tag=Tag.find(params[:id])
  end
  def seguidos
    @condicion = params[:condicion] 
    @usuario=User.find(current_user.id)
    @seguidos=@usuario.tags.all
  end
  def follow
    @tag=Tag.find(params[:id])
    @condicion=1
    current_user.tags.all.each do |seguidos| 
      if seguidos.nombre == @tag.nombre 
        @condicion = 0
      end
    end
    if @condicion != 0 then
      current_user.tags.push(@tag)  
    end
    redirect_to seguidos_tag_path(current_user,:condicion => @condicion)
  end
  def unfollow
    @tag=Tag.find(params[:id])
    @rompio=0
    Tag.all do |tags| 
      if tags.nombre == @tag.nombre 
        @rompio = 1
      end
    end
    if @rompio == 0 then
      current_user.tags.delete(@tag)  
    end
    redirect_to seguidos_tag_path(current_user,:condicion => "1")
  end
  def new
    @tag= Tag.new
    @condicion = params[:condicion]
  end

  def edit
  end

  def create
    @tag = Tag.new(
    params.require(:tag)
    .permit(:nombre)
    )
    @cantidad=Tag.where(nombre: @tag.nombre).count
    @Puede=Permiso.where(nombre:"Crear Etiqueta",tipo:"Necesario").first.cantidad
    @ganancia=Permiso.where(nombre:"Crear Etiqueta",tipo:"Ganancia").first.cantidad
    if current_user.votos > @Puede
      if @cantidad == 0 
        if @tag.save
          current_user.votos= current_user.votos + @ganancia
          byebug
          current_user.save
          redirect_to tags_path(:condicion => 1)

        else
          render :new
        end
      else
        redirect_to tags_path(:condicion => 0)
      end
    else
      redirect_to tags_path(:condicion => 2)
    end
  end

  def update
  end

  def destroy
    @tag=Tag.find(params[:id])
    @tag.destroy
    redirect_to tags_path
  end
end
