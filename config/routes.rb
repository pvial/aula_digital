Rails.application.routes.draw do
  # Routes for the Classroom resource:
  # CREATE
  get "/classrooms/new", :controller => "classrooms", :action => "new"
  post "/create_classroom", :controller => "classrooms", :action => "create"

  # READ
  get "/classrooms", :controller => "classrooms", :action => "index"
  get "/classrooms/:id", :controller => "classrooms", :action => "show"

  # UPDATE
  get "/classrooms/:id/edit", :controller => "classrooms", :action => "edit"
  post "/update_classroom/:id", :controller => "classrooms", :action => "update"

  # DELETE
  get "/delete_classroom/:id", :controller => "classrooms", :action => "destroy"
  #------------------------------

  # Routes for the Nivel resource:
  # CREATE
  get "/nivels/new", :controller => "nivels", :action => "new"
  post "/create_nivel", :controller => "nivels", :action => "create"

  # READ
  get "/nivels", :controller => "nivels", :action => "index"
  get "/nivels/:id", :controller => "nivels", :action => "show"

  # UPDATE
  get "/nivels/:id/edit", :controller => "nivels", :action => "edit"
  post "/update_nivel/:id", :controller => "nivels", :action => "update"

  # DELETE
  get "/delete_nivel/:id", :controller => "nivels", :action => "destroy"
  #------------------------------

  # Routes for the User_level resource:
  # CREATE
  get "/user_levels/new", :controller => "user_levels", :action => "new"
  post "/create_user_level", :controller => "user_levels", :action => "create"

  # READ
  get "/user_levels", :controller => "user_levels", :action => "index"
  get "/user_levels/:id", :controller => "user_levels", :action => "show"

  # UPDATE
  get "/user_levels/:id/edit", :controller => "user_levels", :action => "edit"
  post "/update_user_level/:id", :controller => "user_levels", :action => "update"

  # DELETE
  get "/delete_user_level/:id", :controller => "user_levels", :action => "destroy"
  #------------------------------

  # Routes for the Materium resource:
  # CREATE
  get "/materia/new", :controller => "materia", :action => "new"
  post "/create_materium", :controller => "materia", :action => "create"

  # READ
  get "/materia", :controller => "materia", :action => "index"
  get "/materia/:id", :controller => "materia", :action => "show"

  # UPDATE
  get "/materia/:id/edit", :controller => "materia", :action => "edit"
  post "/update_materium/:id", :controller => "materia", :action => "update"

  # DELETE
  get "/delete_materium/:id", :controller => "materia", :action => "destroy"
  #------------------------------

  # Routes for the Eje resource:
  # CREATE
  get "/ejes/new", :controller => "ejes", :action => "new"
  post "/create_eje", :controller => "ejes", :action => "create"

  # READ
  get "/ejes", :controller => "ejes", :action => "index"
  get "/ejes/:id", :controller => "ejes", :action => "show"

  # UPDATE
  get "/ejes/:id/edit", :controller => "ejes", :action => "edit"
  post "/update_eje/:id", :controller => "ejes", :action => "update"

  # DELETE
  get "/delete_eje/:id", :controller => "ejes", :action => "destroy"
  #------------------------------

  # Routes for the Objetivo resource:
  # CREATE
  get "/objetivos/new", :controller => "objetivos", :action => "new"
  post "/create_objetivo", :controller => "objetivos", :action => "create"

  # READ
  get "/objetivos", :controller => "objetivos", :action => "index"
  get "/objetivos/:id", :controller => "objetivos", :action => "show"

  # UPDATE
  get "/objetivos/:id/edit", :controller => "objetivos", :action => "edit"
  post "/update_objetivo/:id", :controller => "objetivos", :action => "update"

  # DELETE
  get "/delete_objetivo/:id", :controller => "objetivos", :action => "destroy"
  #------------------------------

  # Routes for the Indicator resource:
  # CREATE
  get "/indicators/new", :controller => "indicators", :action => "new"
  post "/create_indicator", :controller => "indicators", :action => "create"

  # READ
  get "/indicators", :controller => "indicators", :action => "index"
  get "/indicators/:id", :controller => "indicators", :action => "show"

  # UPDATE
  get "/indicators/:id/edit", :controller => "indicators", :action => "edit"
  post "/update_indicator/:id", :controller => "indicators", :action => "update"

  # DELETE
  get "/delete_indicator/:id", :controller => "indicators", :action => "destroy"
  #------------------------------

  # Routes for the Try resource:
  # CREATE
  get "/tries/new", :controller => "tries", :action => "new"
  post "/create_try", :controller => "tries", :action => "create"

  # READ
  get "/tries", :controller => "tries", :action => "index"
  get "/tries/:id", :controller => "tries", :action => "show"

  # UPDATE
  get "/tries/:id/edit", :controller => "tries", :action => "edit"
  post "/update_try/:id", :controller => "tries", :action => "update"

  # DELETE
  get "/delete_try/:id", :controller => "tries", :action => "destroy"
  #------------------------------

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
