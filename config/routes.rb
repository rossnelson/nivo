Rails.application.routes.draw do |map|

  mount_at = Nivo::Engine.config.mount_at

  match mount_at => 'nivo/slides#index'

  map.resources :slides, :controller => "nivo/slides",
                               :path_prefix => mount_at,
                               :name_prefix => "nivo_"

  map.resources :manage_slides, :only => [:create],
                                :controller => "nivo/manage_slides",
                                :path_prefix => mount_at,
                                :name_prefix => "nivo_"
end
