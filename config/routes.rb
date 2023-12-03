Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  get "user/new" => "user#index", as: :user
  get "/user/instructor/new" => "user#new", as: :new_instructor
  get "/user/student/new" => "user#new", as: :new_student 
  post "/user/create" => "user#create", as: :users

  get "login" => "session#new", as: :new_session
  post "login" => "session#create", as: :create_session
  delete "logout" => "session#destroy", as: :destroy_session

  post "exam/create" => "exam#create", as: :create_exam
  get "exam/:id", to: "exam#edit", as: :edit_exam
  put "exam/:id" => "exam#update", as: :update_exam
  root "exam#index"
  # Defines the root path route ("/")
  # root "posts#index"
end
