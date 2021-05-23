Rails.application.routes.draw do
  resource :profile, only: %i{show edit update}
  #resources :tasks
  get "/books/:id" => "books#show"
  delete "/books/:id" => "books#destroy"
  resources :publishers
  #resources :publishers do
  #    resources :books
  #    member do 
  #      get 'detail'
  #    end
  #    collection do
  #      get 'search'
  #    end
  #end
end
