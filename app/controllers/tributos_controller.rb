class TributosController < ApplicationController
  def index
    @q = Tributo.ransack(params[:q])
    @tributos = @q.result(:distinct => true).includes(:indicador, :contenido).page(params[:page]).per(10)

    render("tributos/index.html.erb")
  end

  def show
    @tributo = Tributo.find(params[:id])

    render("tributos/show.html.erb")
  end

  def new
    @tributo = Tributo.new

    render("tributos/new.html.erb")
  end

  def create
    @tributo = Tributo.new

    @tributo.contenido_name = params[:contenido_name]
    @tributo.contenido_id = params[:contenido_id]
    @tributo.indicador_name = params[:indicador_name]
    @tributo.indicador_id = params[:indicador_id]

    save_status = @tributo.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/tributos/new", "/create_tributo"
        redirect_to("/tributos")
      else
        redirect_back(:fallback_location => "/", :notice => "Tributo created successfully.")
      end
    else
      render("tributos/new.html.erb")
    end
  end

  def edit
    @tributo = Tributo.find(params[:id])

    render("tributos/edit.html.erb")
  end

  def update
    @tributo = Tributo.find(params[:id])

    @tributo.contenido_name = params[:contenido_name]
    @tributo.contenido_id = params[:contenido_id]
    @tributo.indicador_name = params[:indicador_name]
    @tributo.indicador_id = params[:indicador_id]

    save_status = @tributo.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/tributos/#{@tributo.id}/edit", "/update_tributo"
        redirect_to("/tributos/#{@tributo.id}", :notice => "Tributo updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Tributo updated successfully.")
      end
    else
      render("tributos/edit.html.erb")
    end
  end

  def destroy
    @tributo = Tributo.find(params[:id])

    @tributo.destroy

    if URI(request.referer).path == "/tributos/#{@tributo.id}"
      redirect_to("/", :notice => "Tributo deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Tributo deleted.")
    end
  end
end
