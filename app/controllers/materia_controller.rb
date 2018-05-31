class MateriaController < ApplicationController
  def index
    @materia = Materium.all

    render("materia/index.html.erb")
  end

  def show
    @user_level = UserLevel.new
    @eje = Eje.new
    @materium = Materium.find(params[:id])

    render("materia/show.html.erb")
  end

  def new
    @materium = Materium.new

    render("materia/new.html.erb")
  end

  def create
    @materium = Materium.new

    @materium.description = params[:description]

    save_status = @materium.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/materia/new", "/create_materium"
        redirect_to("/materia")
      else
        redirect_back(:fallback_location => "/", :notice => "Materium created successfully.")
      end
    else
      render("materia/new.html.erb")
    end
  end

  def edit
    @materium = Materium.find(params[:id])

    render("materia/edit.html.erb")
  end

  def update
    @materium = Materium.find(params[:id])

    @materium.description = params[:description]

    save_status = @materium.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/materia/#{@materium.id}/edit", "/update_materium"
        redirect_to("/materia/#{@materium.id}", :notice => "Materium updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Materium updated successfully.")
      end
    else
      render("materia/edit.html.erb")
    end
  end

  def destroy
    @materium = Materium.find(params[:id])

    @materium.destroy

    if URI(request.referer).path == "/materia/#{@materium.id}"
      redirect_to("/", :notice => "Materium deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Materium deleted.")
    end
  end
end
