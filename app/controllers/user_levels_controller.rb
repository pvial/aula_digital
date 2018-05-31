class UserLevelsController < ApplicationController
  def index
    @q = UserLevel.ransack(params[:q])
    @user_levels = @q.result(:distinct => true).includes(:user, :materia).page(params[:page]).per(10)

    render("user_levels/index.html.erb")
  end

  def show
    @user_level = UserLevel.find(params[:id])

    render("user_levels/show.html.erb")
  end

  def new
    @user_level = UserLevel.new

    render("user_levels/new.html.erb")
  end

  def create
    @user_level = UserLevel.new

    @user_level.user_id = params[:user_id]
    @user_level.general = params[:general]
    @user_level.eje_1_placeholder = params[:eje_1_placeholder]
    @user_level.eje_2_placeholder = params[:eje_2_placeholder]
    @user_level.materia_id = params[:materia_id]
    @user_level.date = params[:date]

    save_status = @user_level.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/user_levels/new", "/create_user_level"
        redirect_to("/user_levels")
      else
        redirect_back(:fallback_location => "/", :notice => "User level created successfully.")
      end
    else
      render("user_levels/new.html.erb")
    end
  end

  def edit
    @user_level = UserLevel.find(params[:id])

    render("user_levels/edit.html.erb")
  end

  def update
    @user_level = UserLevel.find(params[:id])

    @user_level.user_id = params[:user_id]
    @user_level.general = params[:general]
    @user_level.eje_1_placeholder = params[:eje_1_placeholder]
    @user_level.eje_2_placeholder = params[:eje_2_placeholder]
    @user_level.materia_id = params[:materia_id]
    @user_level.date = params[:date]

    save_status = @user_level.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/user_levels/#{@user_level.id}/edit", "/update_user_level"
        redirect_to("/user_levels/#{@user_level.id}", :notice => "User level updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "User level updated successfully.")
      end
    else
      render("user_levels/edit.html.erb")
    end
  end

  def destroy
    @user_level = UserLevel.find(params[:id])

    @user_level.destroy

    if URI(request.referer).path == "/user_levels/#{@user_level.id}"
      redirect_to("/", :notice => "User level deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "User level deleted.")
    end
  end
end
