Rails.application.routes.draw do
  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # Routes for the Answer resource:
  # CREATE
  get "/answers/new", :controller => "answers", :action => "new"
  post "/create_answer", :controller => "answers", :action => "create"

  # READ
  get "/answers", :controller => "answers", :action => "index"
  get "/answers/:id", :controller => "answers", :action => "show"

  # UPDATE
  get "/answers/:id/edit", :controller => "answers", :action => "edit"
  post "/update_answer/:id", :controller => "answers", :action => "update"

  # DELETE
  get "/delete_answer/:id", :controller => "answers", :action => "destroy"
  #------------------------------

  # Routes for the Excercise resource:
  # CREATE
  get "/excercises/new", :controller => "excercises", :action => "new"
  post "/create_excercise", :controller => "excercises", :action => "create"

  # READ
  get "/excercises", :controller => "excercises", :action => "index"
  get "/excercises/:id", :controller => "excercises", :action => "show"

  # UPDATE
  get "/excercises/:id/edit", :controller => "excercises", :action => "edit"
  post "/update_excercise/:id", :controller => "excercises", :action => "update"

  # DELETE
  get "/delete_excercise/:id", :controller => "excercises", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
