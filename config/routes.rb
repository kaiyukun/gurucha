Rails.application.routes.draw do
  devise_for :users

  root 'posts#top'
  resources :rooms, only: [:index, :new, :create, :show, :edit, :update] do
    resources :chats, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
