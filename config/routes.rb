Ushorty::Application.routes.draw do
  root :to => 'links#new'

  resources :links, :exclude => [:index, :show, :destroy]
  match '/:hashed' => 'links#redirect'
end
