Rails.application.routes.draw do
root 'pages#home' 
get 'about', to: 'pages#about'
#xpose edit and update routes in resources.
#exposing all RESTFULroutes isnt necessary with resources
resources :jabs #only: [:show, :index, :new, :create, :edit, :update, :destroy]

get 'sign_up', to: 'users#new'
resources :users, except: [:new]
get '/auth/:provider/callback', to: 'sessions#omniauth'
#allows in and out loging
get 'login', to: 'sessions#new'
 #handles form submission
 post 'login', to: 'sessions#create'
 #handle sessions logout
 delete 'logout', to: 'sessions#destroy'
 post '/jabs/:id/edit' => 'jabs#update'
 delete 'jabs/:id/delete' => 'jabs#destroy', as: 'jabs_delete'
 get '/jabs/:id/delete' => 'jabs#destroy'
 resources :categories, except: [:destroy]
end
