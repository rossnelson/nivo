require "nivo/config"
require "nivo/helper"
require "nivo/manage_slides"
# require 'nivo/railtie' if defined?(Rails)
require "nivo/version"

require 'engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3

if defined?(ActionView::Base)
  ActionView::Base.send :include, Nivo::Helper
end
