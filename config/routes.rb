Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'  
  } 
  devise_scope :user do
    get  'family', to: 'users/registrations#new_family'
    post 'family', to: 'users/registrations#create_family'
  end



  
  root 'tasks#index'
  resources :tasks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
