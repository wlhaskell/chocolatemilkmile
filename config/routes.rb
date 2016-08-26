Rails.application.routes.draw do

  root 'registrations#new'
  get 'confirmation' => 'registrations#confirmation'
  post 'checkout' => 'registrations#checkout'
  resources :registrations
  
end
