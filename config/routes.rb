Rails.application.routes.draw do
  root 'homes#top'
  resources :books #resources method
  get 'books/:id' => 'books#show'

end