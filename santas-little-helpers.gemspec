# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "santas-little-helpers/version"

Gem::Specification.new do |s|
  s.name        = "santas-little-helpers"
  s.version     = Santas::Little::Helpers::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Stephan Schubert"]
  s.email       = ["stephan@frozencherry.de"]
  s.homepage    = ""
  s.summary     = %q{A bunch of modules, extensions and other stuff.}
  s.description = %q{I always copy-pasted this stuff to freshly created apps.}

  s.rubyforge_project = "santas-little-helpers"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
