class SalasController < ApplicationController
  def index
    @q = Sala.ransack(params[:q])
    @salas = @q.result(:distinct => true).includes(:profesor, :asignacions, :users, :colegio).page(params[:page]).per(10)

    render("salas/index.html.erb")
  end

  def show
    @user = User.new
    @asignacion = Asignacion.new
    @sala = Sala.find(params[:id])

    render("salas/show.html.erb")
  end

  def new
    @sala = Sala.new

    render("salas/new.html.erb")
  end

  def create
    @sala = Sala.new

    @sala.profesor_id = params[:profesor_id]
    @sala.colegio_id = params[:colegio_id]

    save_status = @sala.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/salas/new", "/create_sala"
        redirect_to("/salas")
      else
        redirect_back(:fallback_location => "/", :notice => "Sala created successfully.")
      end
    else
      render("salas/new.html.erb")
    end
  end

  def edit
    @sala = Sala.find(params[:id])

    render("salas/edit.html.erb")
  end

  def update
    @sala = Sala.find(params[:id])

    @sala.profesor_id = params[:profesor_id]
    @sala.colegio_id = params[:colegio_id]

    save_status = @sala.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/salas/#{@sala.id}/edit", "/update_sala"
        redirect_to("/salas/#{@sala.id}", :notice => "Sala updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Sala updated successfully.")
      end
    else
      render("salas/edit.html.erb")
    end
  end

  def destroy
    @sala = Sala.find(params[:id])

    @sala.destroy

    if URI(request.referer).path == "/salas/#{@sala.id}"
      redirect_to("/", :notice => "Sala deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Sala deleted.")
    end
  end
end
