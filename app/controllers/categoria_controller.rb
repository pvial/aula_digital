class CategoriaController < ApplicationController
  def index
    @q = Categorium.ransack(params[:q])
    @categoria = @q.result(:distinct => true).includes(:eje, :contenidos, :puntajes).page(params[:page]).per(10)

    render("categoria/index.html.erb")
  end

  def show
    @puntaje = Puntaje.new
    @contenido = Contenido.new
    @categorium = Categorium.find(params[:id])

    render("categoria/show.html.erb")
  end

  def new
    @categorium = Categorium.new

    render("categoria/new.html.erb")
  end

  def create
    @categorium = Categorium.new

    @categorium.descripcion = params[:descripcion]
    @categorium.eje_id = params[:eje_id]

    save_status = @categorium.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/categoria/new", "/create_categorium"
        redirect_to("/categoria")
      else
        redirect_back(:fallback_location => "/", :notice => "Categorium created successfully.")
      end
    else
      render("categoria/new.html.erb")
    end
  end

  def edit
    @categorium = Categorium.find(params[:id])

    render("categoria/edit.html.erb")
  end

  def update
    @categorium = Categorium.find(params[:id])

    @categorium.descripcion = params[:descripcion]
    @categorium.eje_id = params[:eje_id]

    save_status = @categorium.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/categoria/#{@categorium.id}/edit", "/update_categorium"
        redirect_to("/categoria/#{@categorium.id}", :notice => "Categorium updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Categorium updated successfully.")
      end
    else
      render("categoria/edit.html.erb")
    end
  end

  def destroy
    @categorium = Categorium.find(params[:id])

    @categorium.destroy

    if URI(request.referer).path == "/categoria/#{@categorium.id}"
      redirect_to("/", :notice => "Categorium deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Categorium deleted.")
    end
  end
end
