Rails.application.routes.draw do
  root to:  'governments#index'
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
  resources :exams,except: [:show] do
    resources :likes, only: [:create, :destroy]
  end
  get 'exams/search'
  resources :governments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
