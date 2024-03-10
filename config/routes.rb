Rails.application.routes.draw do
  root 'homes#top'
  resources :books
=begin
  get 'homes/top'
  get 'books/new'
  get 'books/index'
  get 'books/show'
  get 'books/edit'
=end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end