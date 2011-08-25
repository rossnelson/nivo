Dust::Application.routes.draw do

  resources :sliders

  match "slider/:filename" => "view_sliders#show", :as => :view_slider

  match "all-sliders" => "view_sliders#index", :as => :view_sliders

  get "sitemap/index"
  get "view_page/show"
  get "dashboard/show"

  resources :blocks
  resources :cms_menu_items
  resources :menu_items
  resources :keys
  resources :contacts
  resources :pages
  resources :roles
  resources :users
  resources :user_sessions
  resources :password_resets, :only => [ :new, :create, :edit, :update ]

  match "login" => "user_sessions#new", :as => :login
  match "logout" => "user_sessions#destroy", :as => :logout

  match "dashboard" => "dashboard#show", :as => :dashboard
  match "dashboard/update" => "dashboard#update", :as => :dashboard_update

  match 'menu-manage' => 'menu_items#manage', :as => :menu_manage

  match "sitemap" => "sitemap#index", :as => :sitemap_xml
  match ':filename' => 'view_page#show', :as => :view_page

  match 'download/csv' => 'contacts#csv', :as => :download_csv
  match 'import/csv' => 'contacts#csv_import', :as => :import_csv

  match 'cms_menu/array' => 'cms_menu_items#array', :as => :cms_menu_sort
  match 'menu/array' => 'menu_items#array', :as => :menu_sort

  root :to => "view_page#show", :filename => "welcome"

end
