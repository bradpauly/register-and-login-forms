RegisterAndLogin::Application.routes.draw do
  resources :registrations, only: [:new, :create]
  root 'registrations#new'
end
