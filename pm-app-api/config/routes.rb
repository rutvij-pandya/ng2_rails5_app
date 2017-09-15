Rails.application.routes.draw do  	

  mount_devise_token_auth_for 'User', at: 'auth'
  
  resources :todos
  resources :projects do
  	member do
  		post 'add_developer'
      get 'developers'
  	end
  end

  resources :users, only: [:index, :show] do
  	member do 
  		get 'todos'
      get 'projects'
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
