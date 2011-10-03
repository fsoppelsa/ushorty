Ushorty::Application.routes.draw do
  root :to => 'links#new'
  
  get "error_page", :to => "error_page#error_page"

  resources :links, :exclude => [:index, :show, :destroy]
  match '/:hashed' => 'links#redirect'
end
