Rails.application.routes.draw do


  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations'   }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #POST "/questions/:questions_id/answers"

  resources :questions do
   resources :answers 
   resources :comments
  end

  resources :answers do
    resources :comments
    
  
  end
  resources :comments
  
  resources :tags
  resources :users
  root 'questions#index'

end


