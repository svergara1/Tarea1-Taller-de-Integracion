Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html  
  root 'films#index'
  resources :films do
  	get 'films/:id' => 'films#show'
  end


end
