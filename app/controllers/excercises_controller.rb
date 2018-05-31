class ExcercisesController < ApplicationController
  def index
    @excercises = Excercise.all

    render("excercises/index.html.erb")
  end

  def show
    @excercise = Excercise.find(params[:id])

    render("excercises/show.html.erb")
  end

  def new
    @excercise = Excercise.new

    render("excercises/new.html.erb")
  end

  def create
    @excercise = Excercise.new

    @excercise.contenido_id = params[:contenido_id]
    @excercise.skill = params[:skill]
    @excercise.dificultad = params[:dificultad]
    @excercise.imagen = params[:imagen]
    @excercise.question = params[:question]
    @excercise.indicator_id = params[:indicator_id]

    save_status = @excercise.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/excercises/new", "/create_excercise"
        redirect_to("/excercises")
      else
        redirect_back(:fallback_location => "/", :notice => "Excercise created successfully.")
      end
    else
      render("excercises/new.html.erb")
    end
  end

  def edit
    @excercise = Excercise.find(params[:id])

    render("excercises/edit.html.erb")
  end

  def update
    @excercise = Excercise.find(params[:id])

    @excercise.contenido_id = params[:contenido_id]
    @excercise.skill = params[:skill]
    @excercise.dificultad = params[:dificultad]
    @excercise.imagen = params[:imagen]
    @excercise.question = params[:question]
    @excercise.indicator_id = params[:indicator_id]

    save_status = @excercise.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/excercises/#{@excercise.id}/edit", "/update_excercise"
        redirect_to("/excercises/#{@excercise.id}", :notice => "Excercise updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Excercise updated successfully.")
      end
    else
      render("excercises/edit.html.erb")
    end
  end

  def destroy
    @excercise = Excercise.find(params[:id])

    @excercise.destroy

    if URI(request.referer).path == "/excercises/#{@excercise.id}"
      redirect_to("/", :notice => "Excercise deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Excercise deleted.")
    end
  end
end
