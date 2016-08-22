Rails.application.routes.draw do

  root 'registrations#new'
  resources :registrations
  
end
