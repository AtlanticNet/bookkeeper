Rails.application.routes.draw do
  get 'books/index'

  get 'books/show'

  get 'books/new'

  devise_for :users
  root "pages#home"
end
