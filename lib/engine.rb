require 'nivo'
require 'rails'
require 'paperclip'
require 'haml'
require 'jquery-rails'
# require 'action_controller'


module Nivo
  class Engine < Rails::Engine

    # Config defaults
    config.slider_factory_name = "nivo"
    config.mount_at = '/nivo'

    # Load rake tasks
    rake_tasks do
      load File.join(File.dirname(__FILE__), 'rails/railties/tasks.rake')
    end

    # Check the gem config
    initializer "check config" do |app|

      # make sure mount_at ends with trailing slash
      config.mount_at += '/'  unless config.mount_at.last == '/'
    end

    initializer "static assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end

  end
end

