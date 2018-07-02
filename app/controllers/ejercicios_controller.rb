class EjerciciosController < ApplicationController
  def index
    @q = Ejercicio.ransack(params[:q])
    @ejercicios = @q.result(:distinct => true).includes(:answer, :tries, :indicador, :contenido, :users).page(params[:page]).per(10)

    render("ejercicios/index.html.erb")
  end

  def show
    @try = Try.new
    @ejercicio = Ejercicio.find(params[:id])

    render("ejercicios/show.html.erb")
  end

  def new
    @ejercicio = Ejercicio.new

    render("ejercicios/new.html.erb")
  end

  def create
    @ejercicio = Ejercicio.new

    @ejercicio.contenido_id = params[:contenido_id]
    @ejercicio.dificultad = params[:dificultad]
    @ejercicio.imagen = params[:imagen]
    @ejercicio.pregunta = params[:pregunta]
    @ejercicio.indicador_id = params[:indicador_id]
    @ejercicio.habilidad = params[:habilidad]

    save_status = @ejercicio.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/ejercicios/new", "/create_ejercicio"
        redirect_to("/ejercicios")
      else
        redirect_back(:fallback_location => "/", :notice => "Ejercicio created successfully.")
      end
    else
      render("ejercicios/new.html.erb")
    end
  end

  def edit
    @ejercicio = Ejercicio.find(params[:id])

    render("ejercicios/edit.html.erb")
  end

  def update
    @ejercicio = Ejercicio.find(params[:id])

    @ejercicio.contenido_id = params[:contenido_id]
    @ejercicio.dificultad = params[:dificultad]
    @ejercicio.imagen = params[:imagen]
    @ejercicio.pregunta = params[:pregunta]
    @ejercicio.indicador_id = params[:indicador_id]
    @ejercicio.habilidad = params[:habilidad]

    save_status = @ejercicio.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/ejercicios/#{@ejercicio.id}/edit", "/update_ejercicio"
        redirect_to("/ejercicios/#{@ejercicio.id}", :notice => "Ejercicio updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Ejercicio updated successfully.")
      end
    else
      render("ejercicios/edit.html.erb")
    end
  end

  def destroy
    @ejercicio = Ejercicio.find(params[:id])

    @ejercicio.destroy

    if URI(request.referer).path == "/ejercicios/#{@ejercicio.id}"
      redirect_to("/", :notice => "Ejercicio deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Ejercicio deleted.")
    end
  end
end
