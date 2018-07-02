class EjesController < ApplicationController
  def index
    @q = Eje.ransack(params[:q])
    @ejes = @q.result(:distinct => true).includes(:objetivos, :materias).page(params[:page]).per(10)

    render("ejes/index.html.erb")
  end

  def show
    @categorium = Categorium.new
    @objetivo = Objetivo.new
    @eje = Eje.find(params[:id])

    render("ejes/show.html.erb")
  end

  def new
    @eje = Eje.new

    render("ejes/new.html.erb")
  end

  def create
    @eje = Eje.new

    @eje.materia_id = params[:materia_id]
    @eje.description = params[:description]

    save_status = @eje.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/ejes/new", "/create_eje"
        redirect_to("/ejes")
      else
        redirect_back(:fallback_location => "/", :notice => "Eje created successfully.")
      end
    else
      render("ejes/new.html.erb")
    end
  end

  def edit
    @eje = Eje.find(params[:id])

    render("ejes/edit.html.erb")
  end

  def update
    @eje = Eje.find(params[:id])

    @eje.materia_id = params[:materia_id]
    @eje.description = params[:description]

    save_status = @eje.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/ejes/#{@eje.id}/edit", "/update_eje"
        redirect_to("/ejes/#{@eje.id}", :notice => "Eje updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Eje updated successfully.")
      end
    else
      render("ejes/edit.html.erb")
    end
  end

  def destroy
    @eje = Eje.find(params[:id])

    @eje.destroy

    if URI(request.referer).path == "/ejes/#{@eje.id}"
      redirect_to("/", :notice => "Eje deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Eje deleted.")
    end
  end
end
