RegisterAndLogin::Application.routes.draw do
  resources :registrations
  root 'registrations#new'
end
