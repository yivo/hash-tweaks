# encoding: UTF-8
# frozen_string_literal: true

require File.expand_path('../lib/hash-tweaks/version', __FILE__)

Gem::Specification.new do |s|
  s.name            = 'hash-tweaks'
  s.version         = HashTweaks::VERSION
  s.author          = 'Yaroslav Konoplov'
  s.email           = 'eahome00@gmail.com'
  s.summary         = "Responsibly extends Ruby's Hash with simple and predictable utilities."
  s.description     = "Responsibly extends Ruby's Hash with simple and predictable utilities."
  s.homepage        = 'https://github.com/yivo/hash-tweaks'
  s.license         = 'MIT'

  s.files           = `git ls-files -z`.split("\x0")
  s.test_files      = `git ls-files -z -- {test,spec,features}/*`.split("\x0")
  s.require_paths   = ['lib']

  s.add_dependency 'activesupport', '>= 3.0', '< 6.0'
  s.add_development_dependency 'bundler',   '~> 1.7'
  s.add_development_dependency 'rake',      '~> 12.0'
  s.add_development_dependency 'test-unit', '~> 3.2'
end
