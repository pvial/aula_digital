class ContenidosController < ApplicationController
  def index
    @q = Contenido.ransack(params[:q])
    @contenidos = @q.result(:distinct => true).includes(:materia, :tributos, :ejercicios, :seccions, :indicadors).page(params[:page]).per(10)

    render("contenidos/index.html.erb")
  end

  def show
    @seccion = Seccion.new
    @ejercicio = Ejercicio.new
    @tributo = Tributo.new
    @contenido = Contenido.find(params[:id])

    render("contenidos/show.html.erb")
  end

  def new
    @contenido = Contenido.new

    render("contenidos/new.html.erb")
  end

  def create
    @contenido = Contenido.new

    @contenido.nombre = params[:nombre]
    @contenido.anterior = params[:anterior]
    @contenido.siguiente = params[:siguiente]
    @contenido.categoria_id = params[:categoria_id]

    save_status = @contenido.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/contenidos/new", "/create_contenido"
        redirect_to("/contenidos")
      else
        redirect_back(:fallback_location => "/", :notice => "Contenido created successfully.")
      end
    else
      render("contenidos/new.html.erb")
    end
  end

  def edit
    @contenido = Contenido.find(params[:id])

    render("contenidos/edit.html.erb")
  end

  def update
    @contenido = Contenido.find(params[:id])

    @contenido.nombre = params[:nombre]
    @contenido.anterior = params[:anterior]
    @contenido.siguiente = params[:siguiente]
    @contenido.categoria_id = params[:categoria_id]

    save_status = @contenido.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/contenidos/#{@contenido.id}/edit", "/update_contenido"
        redirect_to("/contenidos/#{@contenido.id}", :notice => "Contenido updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Contenido updated successfully.")
      end
    else
      render("contenidos/edit.html.erb")
    end
  end

  def destroy
    @contenido = Contenido.find(params[:id])

    @contenido.destroy

    if URI(request.referer).path == "/contenidos/#{@contenido.id}"
      redirect_to("/", :notice => "Contenido deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Contenido deleted.")
    end
  end
end
