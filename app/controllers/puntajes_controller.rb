class PuntajesController < ApplicationController
  def index
    @q = Puntaje.ransack(params[:q])
    @puntajes = @q.result(:distinct => true).includes(:materia, :nivel).page(params[:page]).per(10)

    render("puntajes/index.html.erb")
  end

  def show
    @puntaje = Puntaje.find(params[:id])

    render("puntajes/show.html.erb")
  end

  def new
    @puntaje = Puntaje.new

    render("puntajes/new.html.erb")
  end

  def create
    @puntaje = Puntaje.new

    @puntaje.nivel_id = params[:nivel_id]
    @puntaje.categoria_id = params[:categoria_id]
    @puntaje.score = params[:score]

    save_status = @puntaje.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/puntajes/new", "/create_puntaje"
        redirect_to("/puntajes")
      else
        redirect_back(:fallback_location => "/", :notice => "Puntaje created successfully.")
      end
    else
      render("puntajes/new.html.erb")
    end
  end

  def edit
    @puntaje = Puntaje.find(params[:id])

    render("puntajes/edit.html.erb")
  end

  def update
    @puntaje = Puntaje.find(params[:id])

    @puntaje.nivel_id = params[:nivel_id]
    @puntaje.categoria_id = params[:categoria_id]
    @puntaje.score = params[:score]

    save_status = @puntaje.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/puntajes/#{@puntaje.id}/edit", "/update_puntaje"
        redirect_to("/puntajes/#{@puntaje.id}", :notice => "Puntaje updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Puntaje updated successfully.")
      end
    else
      render("puntajes/edit.html.erb")
    end
  end

  def destroy
    @puntaje = Puntaje.find(params[:id])

    @puntaje.destroy

    if URI(request.referer).path == "/puntajes/#{@puntaje.id}"
      redirect_to("/", :notice => "Puntaje deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Puntaje deleted.")
    end
  end
end
