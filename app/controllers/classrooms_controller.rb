class ClassroomsController < ApplicationController
  def index
    @classrooms = Classroom.all

    render("classrooms/index.html.erb")
  end

  def show
    @classroom = Classroom.find(params[:id])

    render("classrooms/show.html.erb")
  end

  def new
    @classroom = Classroom.new

    render("classrooms/new.html.erb")
  end

  def create
    @classroom = Classroom.new

    @classroom.nivel_id = params[:nivel_id]

    save_status = @classroom.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/classrooms/new", "/create_classroom"
        redirect_to("/classrooms")
      else
        redirect_back(:fallback_location => "/", :notice => "Classroom created successfully.")
      end
    else
      render("classrooms/new.html.erb")
    end
  end

  def edit
    @classroom = Classroom.find(params[:id])

    render("classrooms/edit.html.erb")
  end

  def update
    @classroom = Classroom.find(params[:id])

    @classroom.nivel_id = params[:nivel_id]

    save_status = @classroom.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/classrooms/#{@classroom.id}/edit", "/update_classroom"
        redirect_to("/classrooms/#{@classroom.id}", :notice => "Classroom updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Classroom updated successfully.")
      end
    else
      render("classrooms/edit.html.erb")
    end
  end

  def destroy
    @classroom = Classroom.find(params[:id])

    @classroom.destroy

    if URI(request.referer).path == "/classrooms/#{@classroom.id}"
      redirect_to("/", :notice => "Classroom deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Classroom deleted.")
    end
  end
end
