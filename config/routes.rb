Rails.application.routes.draw do


  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations'   }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #POST "/questions/:questions_id/answers"

  resources :questions do
   resources :answers 
   resources :question_comments, controller: "question_comments"
    
  
  end
  resources :answers do
    resources :answer_comments, controller: "answer_comments"
  end
  
  resources :comments
  
  resources :tags
  resources :users
  root 'questions#index'

end


