Rails.application.routes.draw do
  root 'pages#index'
  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create edit update]
  resources :questions do
    resources :answers, only: %i[create edit update destroy]
  end
  
  #get '/questions', to: 'questions#index'
end
