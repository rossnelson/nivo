# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "nivo/version"

Gem::Specification.new do |s|
  s.name        = "nivo"
  s.version     = Nivo::VERSION
  s.authors     = ["Ross Nelson"]
  s.email       = ["axcess1@me.com"]
  s.homepage    = ""
  s.summary     = %q{Easily add nivo slider and slide management to dust}
  s.description = %q{Easily add nivo slider and slide management to dust}

  s.rubyforge_project = "nivo"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  ##
  # specify any dependencies here; for example:
  #
  s.add_development_dependency "shoulda"

  s.add_runtime_dependency "paperclip"
end
