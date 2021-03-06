require 'rails/generators'
require 'rails/generators/migration'

module Nivo
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      def self.source_root
        File.join(File.dirname(__FILE__), 'templates')
      end

      def create_config
        copy_file "nivo_config.yml", "config/nivo_config.yml"
      end

      def self.next_migration_number(dirname) #:nodoc:
        if ActiveRecord::Base.timestamped_migrations
          Time.now.utc.strftime("%Y%m%d%H%M%S")
        else
          "%.3d" % (current_migration_number(dirname) + 1)
        end
      end

      # Every method that is declared below will be automatically executed when the generator is run

      def create_migration_file
        f = File.open File.join(File.dirname(__FILE__), 'templates', 'schema.rb')
        schema = f.read; f.close

        schema.gsub!(/ActiveRecord::Schema.*\n/, '')
        schema.gsub!(/^end\n*$/, '')

        f = File.open File.join(File.dirname(__FILE__), 'templates', 'migration.rb')
        migration = f.read; f.close
        migration.gsub!(/SCHEMA_AUTO_INSERTED_HERE/, schema)

        tmp = File.open "tmp/~migration_ready.rb", "w"
        tmp.write migration
        tmp.close

        migration_template  '../../../../tmp/~migration_ready.rb',
          'db/migrate/create_nivo_tables.rb'
        remove_file 'tmp/~migration_ready.rb'
      end

    end
  end
end
