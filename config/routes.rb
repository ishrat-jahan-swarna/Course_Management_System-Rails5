Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  devise_for :users, controllers: { sessions: 'users/sessions' }
  get 'chatroom_users/create'
  get 'chatroom_users/destroy'
  resources :chatrooms do
    resource :chatroom_users
    resources :messages
  end
  resources :user_profiles
  post 'welcome_student/reg_backlog'
  post 'welcome_student/sel_for_backlog'
  post 'users/approve_user'
  post 'users/set_fail_log'
  post 'users/set_pass_log'
  post 'users/set_fail'
  post 'users/set_pass'
  get 'welcome_student/course_status'
  post 'welcome_student/course_status'
  get 'courses/show_courses_user'
  get 'courses/show_user'
  post 'welcome_student/enroll_courses'
  post 'welcome_student/sel_to_enroll'
  post 'welcome_student/available_courses'
  get 'welcome_student/available_courses'
  get 'departments/show_user'
  get 'course_dept/show_courses_user'
  get 'welcome_student/index'
  post 'course_dept/remove_course'
  post 'course_dept/add_course'
  post 'course_dept/sel_course'
  get 'course_dept/show_courses'
  get 'course_dept/index'
  get 'welcome/index'
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

  mount ActionCable.server => '/cable'
end

