Rails.application.routes.draw do
  devise_for :users
  get '/input' => 'number#input', as:'user_root'

  get '/view' => 'number#view'

  root 'number#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
