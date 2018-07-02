class AsignacionsController < ApplicationController
  def index
    @q = Asignacion.ransack(params[:q])
    @asignacions = @q.result(:distinct => true).includes(:sala, :test).page(params[:page]).per(10)

    render("asignacions/index.html.erb")
  end

  def show
    @asignacion = Asignacion.find(params[:id])

    render("asignacions/show.html.erb")
  end

  def new
    @asignacion = Asignacion.new

    render("asignacions/new.html.erb")
  end

  def create
    @asignacion = Asignacion.new

    @asignacion.test_id = params[:test_id]
    @asignacion.sala_id = params[:sala_id]

    save_status = @asignacion.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/asignacions/new", "/create_asignacion"
        redirect_to("/asignacions")
      else
        redirect_back(:fallback_location => "/", :notice => "Asignacion created successfully.")
      end
    else
      render("asignacions/new.html.erb")
    end
  end

  def edit
    @asignacion = Asignacion.find(params[:id])

    render("asignacions/edit.html.erb")
  end

  def update
    @asignacion = Asignacion.find(params[:id])

    @asignacion.test_id = params[:test_id]
    @asignacion.sala_id = params[:sala_id]

    save_status = @asignacion.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/asignacions/#{@asignacion.id}/edit", "/update_asignacion"
        redirect_to("/asignacions/#{@asignacion.id}", :notice => "Asignacion updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Asignacion updated successfully.")
      end
    else
      render("asignacions/edit.html.erb")
    end
  end

  def destroy
    @asignacion = Asignacion.find(params[:id])

    @asignacion.destroy

    if URI(request.referer).path == "/asignacions/#{@asignacion.id}"
      redirect_to("/", :notice => "Asignacion deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Asignacion deleted.")
    end
  end
end
