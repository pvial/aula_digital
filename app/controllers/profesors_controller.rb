class ProfesorsController < ApplicationController
  def index
    @profesors = Profesor.page(params[:page]).per(10)
  end

  def show
    @profesor = Profesor.find(params[:id])
  end
end
