# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'yard/mongoid/version'

Gem::Specification.new do |s|
  s.name = 'yard-mongoid'
  s.version     = YARD::Mongoid::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ['Alexander Semyonov']
  s.email = %w(al@semyonov.us)
  s.homepage = 'http://rubygems.org/gems/yard-mongoid'
  s.summary = 'A Yard plugin for parsing Mongoid model syntax.'
  s.description = 'Once yard-mongoid is installed, YARD will automatically load the plugin when ever the `yard doc` utility is ran on a project.'

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.bindir = 'exe'
  s.executables = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = %w(lib)

  s.add_runtime_dependency 'yard', '>= 0.8.4'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'mongoid', '>= 3.0'
  s.add_development_dependency 'pry'
end
