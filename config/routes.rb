Rails.application.routes.draw do
  get 'welcome_student/index'
  post 'course_dept/remove_course'
  post 'course_dept/add_course'
  post 'course_dept/sel_course'
  get 'course_dept/index'
  get 'welcome/index'
  controller :sessions do
    get 'login' => :new
    get 'login_user' => :new_user
    post 'login' => :create
    post 'login_user' => :create
    delete 'logout' => :destroy
    delete 'logout_user' => :destroy_user
  end
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  get 'first/index'
  root 'first#index'
  resources :admins
  resources :users
  resources :departments
  resources :courses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
