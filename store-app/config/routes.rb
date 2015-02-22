Rails.application.routes.draw do
  devise_for :users
  get '/'                   => 'products#index'
  get '/products'           => 'products#index'
  root to:                     'roducts#index'
  get '/products/new'       => 'products#new'
  post '/products'          => 'products#create'
  post '/orders'            => 'orders#create'
  get '/products/:id'       => 'products#show'
  get '/products/:id/edit'  => 'products#edit'
  patch 'products/:id'      => 'products#update'
  delete 'products/:id'     => 'products#destroy'

    # url => controler/action
    #look up helper methods in rails
  
end

# use @recipes.each_slice(3) do |number|
# <% @products.each_slice(3) do |number|