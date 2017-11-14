Rails.application.routes.draw do
  get 'comments/index'

  get 'comments/show'

  get 'comments/new'

  get 'comments/edit'

  get 'comments/create'

  get 'comments/update'

  get 'comments/destroy'

  get 'tags/index'

  get 'tags/show'

  get 'tags/new'

  get 'tags/edit'

  get 'tags/create'

  get 'tags/update'

  get 'tags/destroy'

  get 'answers/index'

  get 'answers/show'

  get 'answers/new'

  get 'answers/edit'

  get 'answers/create'

  get 'answers/update'

  get 'answers/destroy'

  get 'questions/view'

  get 'default/index'


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
  resources :questions
  resources :answers
  resources :comments
  resources :tags
  resources :users
  root 'questions#index'

end


