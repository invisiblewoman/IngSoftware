  Rails.application.routes.draw do


 
get 'recu_pass' => 'recu_pass#recuperar'
  post 'recu_pass' => 'recu_pass#create'

  get 'send/index'
  get 'send' => 'send#index'
  post 'send' => 'send#create'

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations'   }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #POST "/questions/:questions_id/answers"
  get 'users/show/:id' => "users#show", as:'perfil'

  resources :questions do
   resources :answers 

   resources :question_comments, controller: "question_comments"
   get :bestAnswer
   get :masvisitadas,on: :member
  
  end
  resources :answers do
    resources :answer_comments, controller: "answer_comments"
  end
  resources :comments
  resources :universities do
    get :seguidos, on: :member
    get :follow, on:   :member
    get :unfollow, on:   :member
    get :destroy
  end
  resources :tags do
    get :seguidos, on: :member
    get :follow, on:   :member
    get :unfollow, on:   :member
    get :destroy
  end
  resources :votes do
    get :voteQuestion
  end
  resources :permisos do
  end
  resources :tags
  resources :users
  resources :reports do
    get :reportes, on: :member
  end
  root 'questions#index'

end

