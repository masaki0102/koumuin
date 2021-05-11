Rails.application.routes.draw do
  root to:  'exams#index'
  devise_for :governments, controllers: {
    sessions:      'governments/sessions',
    passwords:     'governments/passwords',
    registrations: 'governments/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  get 'exams/search_result'
  resources :exams do
    get 'likes', to: 'likes#checked'
  end
  
  resources :governments, only: [:index, :show]
  resources :likes, only: [:show]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
