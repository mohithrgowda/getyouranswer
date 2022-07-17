Rails.application.routes.draw do
  
  devise_for :users , controllers: {
    sessions: 'users/sessions' ,
    registrations: 'users/registrations'
  }
  get "/u/:id" ,to: "users#profile" , as: "user"
 
  get "about" ,to: "pages#about"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :questions do
    resources :answers
  end

  # Defines the root path route ("/")
  root "pages#home"
  resources :tags , except: [:destroy]
end
