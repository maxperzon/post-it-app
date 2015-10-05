Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :quotes

  authenticated :user do
  	root 'quotes#index', as: "authenticated_root"
  end

  root 'welcome#index'
end
