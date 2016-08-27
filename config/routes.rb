Rails.application.routes.draw do

  root 'registrations#new'
  get 'unauthorized' => 'registrations#unauthorized'
  get 'confirmation' => 'registrations#confirmation'
  post 'checkout' => 'registrations#checkout'
  resources :registrations
  
end
