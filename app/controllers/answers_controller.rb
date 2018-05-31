class AnswersController < ApplicationController
  def index
    @answers = Answer.page(params[:page]).per(10)

    render("answers/index.html.erb")
  end

  def show
    @answer = Answer.find(params[:id])

    render("answers/show.html.erb")
  end

  def new
    @answer = Answer.new

    render("answers/new.html.erb")
  end

  def create
    @answer = Answer.new

    @answer.right_answer = params[:right_answer]
    @answer.wrong_1 = params[:wrong_1]
    @answer.wrong_2 = params[:wrong_2]
    @answer.wrong_3 = params[:wrong_3]
    @answer.wrong_4 = params[:wrong_4]
    @answer.excercise_id = params[:excercise_id]

    save_status = @answer.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/answers/new", "/create_answer"
        redirect_to("/answers")
      else
        redirect_back(:fallback_location => "/", :notice => "Answer created successfully.")
      end
    else
      render("answers/new.html.erb")
    end
  end

  def edit
    @answer = Answer.find(params[:id])

    render("answers/edit.html.erb")
  end

  def update
    @answer = Answer.find(params[:id])

    @answer.right_answer = params[:right_answer]
    @answer.wrong_1 = params[:wrong_1]
    @answer.wrong_2 = params[:wrong_2]
    @answer.wrong_3 = params[:wrong_3]
    @answer.wrong_4 = params[:wrong_4]
    @answer.excercise_id = params[:excercise_id]

    save_status = @answer.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/answers/#{@answer.id}/edit", "/update_answer"
        redirect_to("/answers/#{@answer.id}", :notice => "Answer updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Answer updated successfully.")
      end
    else
      render("answers/edit.html.erb")
    end
  end

  def destroy
    @answer = Answer.find(params[:id])

    @answer.destroy

    if URI(request.referer).path == "/answers/#{@answer.id}"
      redirect_to("/", :notice => "Answer deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Answer deleted.")
    end
  end
end
