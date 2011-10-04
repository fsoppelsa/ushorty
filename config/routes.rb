Ushorty::Application.routes.draw do
  root :to => 'links#new'
  
  get "error_page", :to => "error_page#error_page"

  resources :links, :exclude => [:index, :show, :destroy]
  match '/?myurl' => 'links#ws_url'
  match '/:hashed' => 'links#redirect'
end
