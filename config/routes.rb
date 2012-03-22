Ushorty::Application.routes.draw do
  devise_for :admins,
    :path => "admin",
    :path_names => { :sign_in => 'login', :sign_out => 'logout'}

  root :to => 'links#new'
  
  get "error_page", :to => "error_page#error_page"

  resources :links, :exclude => [:index, :show, :destroy]
  match '/:hashed' => 'links#redirect'
end
