class ColegiosController < ApplicationController
  def index
    @q = Colegio.ransack(params[:q])
    @colegios = @q.result(:distinct => true).includes(:salas, :profesors).page(params[:page]).per(10)

    render("colegios/index.html.erb")
  end

  def show
    @sala = Sala.new
    @colegio = Colegio.find(params[:id])

    render("colegios/show.html.erb")
  end

  def new
    @colegio = Colegio.new

    render("colegios/new.html.erb")
  end

  def create
    @colegio = Colegio.new

    @colegio.nombre = params[:nombre]

    save_status = @colegio.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/colegios/new", "/create_colegio"
        redirect_to("/colegios")
      else
        redirect_back(:fallback_location => "/", :notice => "Colegio created successfully.")
      end
    else
      render("colegios/new.html.erb")
    end
  end

  def edit
    @colegio = Colegio.find(params[:id])

    render("colegios/edit.html.erb")
  end

  def update
    @colegio = Colegio.find(params[:id])

    @colegio.nombre = params[:nombre]

    save_status = @colegio.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/colegios/#{@colegio.id}/edit", "/update_colegio"
        redirect_to("/colegios/#{@colegio.id}", :notice => "Colegio updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Colegio updated successfully.")
      end
    else
      render("colegios/edit.html.erb")
    end
  end

  def destroy
    @colegio = Colegio.find(params[:id])

    @colegio.destroy

    if URI(request.referer).path == "/colegios/#{@colegio.id}"
      redirect_to("/", :notice => "Colegio deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Colegio deleted.")
    end
  end
end
