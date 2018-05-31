class NivelsController < ApplicationController
  def index
    @q = Nivel.ransack(params[:q])
    @nivels = @q.result(:distinct => true).includes(:objetivos, :classrooms).page(params[:page]).per(10)

    render("nivels/index.html.erb")
  end

  def show
    @classroom = Classroom.new
    @objetivo = Objetivo.new
    @nivel = Nivel.find(params[:id])

    render("nivels/show.html.erb")
  end

  def new
    @nivel = Nivel.new

    render("nivels/new.html.erb")
  end

  def create
    @nivel = Nivel.new

    @nivel.intended_year = params[:intended_year]

    save_status = @nivel.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/nivels/new", "/create_nivel"
        redirect_to("/nivels")
      else
        redirect_back(:fallback_location => "/", :notice => "Nivel created successfully.")
      end
    else
      render("nivels/new.html.erb")
    end
  end

  def edit
    @nivel = Nivel.find(params[:id])

    render("nivels/edit.html.erb")
  end

  def update
    @nivel = Nivel.find(params[:id])

    @nivel.intended_year = params[:intended_year]

    save_status = @nivel.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/nivels/#{@nivel.id}/edit", "/update_nivel"
        redirect_to("/nivels/#{@nivel.id}", :notice => "Nivel updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Nivel updated successfully.")
      end
    else
      render("nivels/edit.html.erb")
    end
  end

  def destroy
    @nivel = Nivel.find(params[:id])

    @nivel.destroy

    if URI(request.referer).path == "/nivels/#{@nivel.id}"
      redirect_to("/", :notice => "Nivel deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Nivel deleted.")
    end
  end
end
