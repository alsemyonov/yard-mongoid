# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'yard/mongoid/version'

Gem::Specification.new do |s|
  s.name        = 'yard-mongoid'
  s.version     = Yard::Mongoid::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Alexander Semyonov']
  s.email       = %w(al@semyonov.us)
  s.homepage    = 'http://rubygems.org/gems/yard-mongoid'
  s.summary     = %q{A Yard plugin for parsing Mongoid model syntax.}
  s.description = %q{Once yard-mongoid is installed, YARD will automatically load the plugin when ever the `yard doc` utility is ran on a project.}

  s.rubyforge_project = 'yard-mongoid'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = %w(lib)

  s.add_dependency 'yard', '~> 0.8.4'
end
