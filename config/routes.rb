Rails.application.routes.draw do |map|

  mount_at = Nivo::Engine.config.mount_at

  match mount_at => 'nivo/sliders#index'

  map.resources :sliders, :controller => "nivo/sliders",
                               :path_prefix => mount_at,
                               :name_prefix => ""
end
