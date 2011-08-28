require 'rails/generators'
require 'rails/generators/migration'

module Nivo
  module Generators
    class ViewsGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../../../app/views", __FILE__)
      desc "Copies all Nivo views to your application."

      argument :scope, :required => false, :default => nil,
                       :desc => "The scope to copy views to"

      def copy_views
        directory "nivo", "app/views/#{scope || :nivo}"
      end
    end
  end
end
