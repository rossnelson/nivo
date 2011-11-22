require 'rails/generators'
require 'rails/generators/migration'

module Nivo
  module Generators
    class ModelGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../../../app/models", __FILE__)
      desc "Copies the Nivo::Slide model to your application."

      argument :scope, :required => false, :default => nil,
                       :desc => "The scope to copy the model to"

      def copy_model
        directory "nivo", "app/models/#{scope || :nivo}"
      end
    end
  end
end
