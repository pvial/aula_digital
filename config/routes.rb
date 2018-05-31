Rails.application.routes.draw do
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
