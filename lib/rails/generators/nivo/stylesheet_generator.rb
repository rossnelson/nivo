require 'rails/generators'
require 'rails/generators/migration'

module Nivo
  module Generators
    class StylesheetGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../../../public/stylesheets", __FILE__)
      desc "Copies Nivo stylesheets to your application."

      argument :scope, :required => false, :default => nil,
                       :desc => "The scope to copy stylesheets to"

      def copy_stylesheets
        copy_file "default.css", "public/stylesheets/default.css"
      end
    end
  end
end
