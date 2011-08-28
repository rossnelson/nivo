require 'rails/generators'
require 'rails/generators/migration'

module Nivo
  module Generators
    class ControllerGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../../../app/controllers", __FILE__)
      desc "Copies the Nivo::Slide model to your application."

      argument :scope, :required => false, :default => nil,
                       :desc => "The scope to copy views to"

      def copy_model
        directory "nivo", "app/controllers/#{scope || :nivo}"
      end
    end
  end
end
