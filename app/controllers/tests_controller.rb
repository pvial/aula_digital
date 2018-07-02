class TestsController < ApplicationController
  def index
    @q = Test.ransack(params[:q])
    @tests = @q.result(:distinct => true).includes(:profesor, :intento_tests, :asignacions, :seccions).page(params[:page]).per(10)

    render("tests/index.html.erb")
  end

  def show
    @seccion = Seccion.new
    @asignacion = Asignacion.new
    @intento_test = IntentoTest.new
    @test = Test.find(params[:id])

    render("tests/show.html.erb")
  end

  def new
    @test = Test.new

    render("tests/new.html.erb")
  end

  def create
    @test = Test.new

    @test.profesor_id = params[:profesor_id]

    save_status = @test.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/tests/new", "/create_test"
        redirect_to("/tests")
      else
        redirect_back(:fallback_location => "/", :notice => "Test created successfully.")
      end
    else
      render("tests/new.html.erb")
    end
  end

  def edit
    @test = Test.find(params[:id])

    render("tests/edit.html.erb")
  end

  def update
    @test = Test.find(params[:id])

    @test.profesor_id = params[:profesor_id]

    save_status = @test.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/tests/#{@test.id}/edit", "/update_test"
        redirect_to("/tests/#{@test.id}", :notice => "Test updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Test updated successfully.")
      end
    else
      render("tests/edit.html.erb")
    end
  end

  def destroy
    @test = Test.find(params[:id])

    @test.destroy

    if URI(request.referer).path == "/tests/#{@test.id}"
      redirect_to("/", :notice => "Test deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Test deleted.")
    end
  end
end
