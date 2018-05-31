class TriesController < ApplicationController
  def index
    @tries = Try.all

    render("tries/index.html.erb")
  end

  def show
    @try = Try.find(params[:id])

    render("tries/show.html.erb")
  end

  def new
    @try = Try.new

    render("tries/new.html.erb")
  end

  def create
    @try = Try.new

    @try.user_id = params[:user_id]
    @try.excercise_id = params[:excercise_id]
    @try.user_answer = params[:user_answer]
    @try.correct = params[:correct]
    @try.active = params[:active]

    save_status = @try.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/tries/new", "/create_try"
        redirect_to("/tries")
      else
        redirect_back(:fallback_location => "/", :notice => "Try created successfully.")
      end
    else
      render("tries/new.html.erb")
    end
  end

  def edit
    @try = Try.find(params[:id])

    render("tries/edit.html.erb")
  end

  def update
    @try = Try.find(params[:id])

    @try.user_id = params[:user_id]
    @try.excercise_id = params[:excercise_id]
    @try.user_answer = params[:user_answer]
    @try.correct = params[:correct]
    @try.active = params[:active]

    save_status = @try.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/tries/#{@try.id}/edit", "/update_try"
        redirect_to("/tries/#{@try.id}", :notice => "Try updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Try updated successfully.")
      end
    else
      render("tries/edit.html.erb")
    end
  end

  def destroy
    @try = Try.find(params[:id])

    @try.destroy

    if URI(request.referer).path == "/tries/#{@try.id}"
      redirect_to("/", :notice => "Try deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Try deleted.")
    end
  end
end
