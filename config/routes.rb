Rails.application.routes.draw do
  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root "home#index"

get "sows" => "sows#show"

resources :issues do
   resources :comments
 end
end
