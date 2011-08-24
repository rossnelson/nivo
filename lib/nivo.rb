require "nivo/version"
require "nivo/helper"
require 'engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3

if defined?(ActionView::Base)
  ActionView::Base.send :include, Nivo::Helper
end

