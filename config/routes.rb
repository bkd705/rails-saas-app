Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  # resources has all rest routes, but we only want the 'create' POST route
  resources :contacts, only: :create
  # change the get route, and rename it as 'new_contact'
  get 'contact-us', to: 'contacts#new', as: 'new_contact'
end
