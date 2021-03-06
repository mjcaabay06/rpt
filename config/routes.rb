Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => 'application#index'

  namespace :admin do
  	get '/' => 'home#index'
  	get 'login' => 'home#login'
  	post 'login-auth' => 'home#login_auth'
  	get 'logout' => 'home#logout'

  	resources :orders
  	get '/orders/print/:id' => 'orders#print'
  	post '/orders/print_submit' => 'orders#print_submit'
  	get '/orders/successful/:id' => 'orders#successful'
  	get '/get_order_items/:id' => 'orders#get_order_items'
  end
end
