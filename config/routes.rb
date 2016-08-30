Rails.application.routes.draw do

  root 'registrations#new'
  get 'login_admin' => 'admin#login'
  post 'check_password' => 'admin#check'
  get 'unauthorized' => 'registrations#unauthorized'
  get 'confirmation' => 'registrations#confirmation'
  post 'checkout' => 'registrations#checkout'
  get 'credits' => 'registrations#credits'
  resources :registrations
  
end
