class SeccionsController < ApplicationController
  def index
    @q = Seccion.ransack(params[:q])
    @seccions = @q.result(:distinct => true).includes(:contenido, :test).page(params[:page]).per(10)

    render("seccions/index.html.erb")
  end

  def show
    @seccion = Seccion.find(params[:id])

    render("seccions/show.html.erb")
  end

  def new
    @seccion = Seccion.new

    render("seccions/new.html.erb")
  end

  def create
    @seccion = Seccion.new

    @seccion.contenido_id = params[:contenido_id]
    @seccion.test_id = params[:test_id]
    @seccion.numero_ejercicios = params[:numero_ejercicios]

    save_status = @seccion.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/seccions/new", "/create_seccion"
        redirect_to("/seccions")
      else
        redirect_back(:fallback_location => "/", :notice => "Seccion created successfully.")
      end
    else
      render("seccions/new.html.erb")
    end
  end

  def edit
    @seccion = Seccion.find(params[:id])

    render("seccions/edit.html.erb")
  end

  def update
    @seccion = Seccion.find(params[:id])

    @seccion.contenido_id = params[:contenido_id]
    @seccion.test_id = params[:test_id]
    @seccion.numero_ejercicios = params[:numero_ejercicios]

    save_status = @seccion.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/seccions/#{@seccion.id}/edit", "/update_seccion"
        redirect_to("/seccions/#{@seccion.id}", :notice => "Seccion updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Seccion updated successfully.")
      end
    else
      render("seccions/edit.html.erb")
    end
  end

  def destroy
    @seccion = Seccion.find(params[:id])

    @seccion.destroy

    if URI(request.referer).path == "/seccions/#{@seccion.id}"
      redirect_to("/", :notice => "Seccion deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Seccion deleted.")
    end
  end
end
