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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
