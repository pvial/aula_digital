class IntentoTestsController < ApplicationController
  before_action :current_user_must_be_intento_test_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_intento_test_user
    intento_test = IntentoTest.find(params[:id])

    unless current_user == intento_test.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.intento_tests.ransack(params[:q])
    @intento_tests = @q.result(:distinct => true).includes(:user, :test, :tries).page(params[:page]).per(10)

    render("intento_tests/index.html.erb")
  end

  def show
    @try = Try.new
    @intento_test = IntentoTest.find(params[:id])

    render("intento_tests/show.html.erb")
  end

  def new
    @intento_test = IntentoTest.new

    render("intento_tests/new.html.erb")
  end

  def create
    @intento_test = IntentoTest.new

    @intento_test.test_id = params[:test_id]
    @intento_test.user_id = params[:user_id]

    save_status = @intento_test.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/intento_tests/new", "/create_intento_test"
        redirect_to("/intento_tests")
      else
        redirect_back(:fallback_location => "/", :notice => "Intento test created successfully.")
      end
    else
      render("intento_tests/new.html.erb")
    end
  end

  def edit
    @intento_test = IntentoTest.find(params[:id])

    render("intento_tests/edit.html.erb")
  end

  def update
    @intento_test = IntentoTest.find(params[:id])

    @intento_test.test_id = params[:test_id]
    @intento_test.user_id = params[:user_id]

    save_status = @intento_test.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/intento_tests/#{@intento_test.id}/edit", "/update_intento_test"
        redirect_to("/intento_tests/#{@intento_test.id}", :notice => "Intento test updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Intento test updated successfully.")
      end
    else
      render("intento_tests/edit.html.erb")
    end
  end

  def destroy
    @intento_test = IntentoTest.find(params[:id])

    @intento_test.destroy

    if URI(request.referer).path == "/intento_tests/#{@intento_test.id}"
      redirect_to("/", :notice => "Intento test deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Intento test deleted.")
    end
  end
end
