class IndicatorsController < ApplicationController
  def index
    @indicators = Indicator.page(params[:page]).per(10)

    render("indicators/index.html.erb")
  end

  def show
    @excercise = Excercise.new
    @indicator = Indicator.find(params[:id])

    render("indicators/show.html.erb")
  end

  def new
    @indicator = Indicator.new

    render("indicators/new.html.erb")
  end

  def create
    @indicator = Indicator.new

    @indicator.pre_indicator_id = params[:pre_indicator_id]
    @indicator.next_indicator_id = params[:next_indicator_id]
    @indicator.objetivo_id = params[:objetivo_id]
    @indicator.description = params[:description]

    save_status = @indicator.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/indicators/new", "/create_indicator"
        redirect_to("/indicators")
      else
        redirect_back(:fallback_location => "/", :notice => "Indicator created successfully.")
      end
    else
      render("indicators/new.html.erb")
    end
  end

  def edit
    @indicator = Indicator.find(params[:id])

    render("indicators/edit.html.erb")
  end

  def update
    @indicator = Indicator.find(params[:id])

    @indicator.pre_indicator_id = params[:pre_indicator_id]
    @indicator.next_indicator_id = params[:next_indicator_id]
    @indicator.objetivo_id = params[:objetivo_id]
    @indicator.description = params[:description]

    save_status = @indicator.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/indicators/#{@indicator.id}/edit", "/update_indicator"
        redirect_to("/indicators/#{@indicator.id}", :notice => "Indicator updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Indicator updated successfully.")
      end
    else
      render("indicators/edit.html.erb")
    end
  end

  def destroy
    @indicator = Indicator.find(params[:id])

    @indicator.destroy

    if URI(request.referer).path == "/indicators/#{@indicator.id}"
      redirect_to("/", :notice => "Indicator deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Indicator deleted.")
    end
  end
end
