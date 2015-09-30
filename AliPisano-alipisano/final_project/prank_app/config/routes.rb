Rails.application.routes.draw do

#create a messages resource- CRUD operations
resources :messages

#tells Rails to map requests to http://localhost:3000/home to the static page home controller
get 'home', to: "static_pages#home"

#tell Rails to map requests to the root of the application to the static page home controller
root 'static_pages#home'

end
