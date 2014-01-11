RegisterAndLogin::Application.routes.draw do
  resources :registrations, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  root 'registrations#new'
end
