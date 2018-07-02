class ObjetivosController < ApplicationController
  def index
    @q = Objetivo.ransack(params[:q])
    @objetivos = @q.result(:distinct => true).includes(:indicators, :eje).page(params[:page]).per(10)

    render("objetivos/index.html.erb")
  end

  def show
    @indicator = Indicator.new
    @objetivo = Objetivo.find(params[:id])

    render("objetivos/show.html.erb")
  end

  def new
    @objetivo = Objetivo.new

    render("objetivos/new.html.erb")
  end

  def create
    @objetivo = Objetivo.new

    @objetivo.eje_id = params[:eje_id]
    @objetivo.descripcion = params[:descripcion]
    @objetivo.numeral = params[:numeral]

    save_status = @objetivo.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/objetivos/new", "/create_objetivo"
        redirect_to("/objetivos")
      else
        redirect_back(:fallback_location => "/", :notice => "Objetivo created successfully.")
      end
    else
      render("objetivos/new.html.erb")
    end
  end

  def edit
    @objetivo = Objetivo.find(params[:id])

    render("objetivos/edit.html.erb")
  end

  def update
    @objetivo = Objetivo.find(params[:id])

    @objetivo.eje_id = params[:eje_id]
    @objetivo.descripcion = params[:descripcion]
    @objetivo.numeral = params[:numeral]

    save_status = @objetivo.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/objetivos/#{@objetivo.id}/edit", "/update_objetivo"
        redirect_to("/objetivos/#{@objetivo.id}", :notice => "Objetivo updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Objetivo updated successfully.")
      end
    else
      render("objetivos/edit.html.erb")
    end
  end

  def destroy
    @objetivo = Objetivo.find(params[:id])

    @objetivo.destroy

    if URI(request.referer).path == "/objetivos/#{@objetivo.id}"
      redirect_to("/", :notice => "Objetivo deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Objetivo deleted.")
    end
  end
end
