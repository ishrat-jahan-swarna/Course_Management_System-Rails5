Rails.application.routes.draw do
  get 'welcome/index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  get 'first/index'
  root 'first#index'
  resources :admins
  resources :departments
  resources :courses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
