Rails.application.routes.draw do
  resources :registration, only: %i[index create new]


  get 'hello_world', to: 'hello_world#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "main_page#index"
end
