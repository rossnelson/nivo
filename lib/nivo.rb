require "nivo/version"
require "nivo/helper"
require "nivo/config"
require "nivo/manage_slides"
require 'engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3

if defined?(ActionView::Base)
  ActionView::Base.send :include, Nivo::Helper
end

Dir.glob(File.join(File.dirname(__FILE__), "../", "db", "migrate", "*")).each do |file|
  require file
end
