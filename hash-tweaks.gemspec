# encoding: UTF-8
# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name          = "hash-tweaks"
  s.version       = "1.0.1"
  s.author        = "Yaroslav Konoplov"
  s.email         = "eahome00@gmail.com"
  s.summary       = "Utilities for Ruby's hash."
  s.description   = "A gem extending Ruby's hash with useful utilities."
  s.homepage      = "https://github.com/yivo/hash-tweaks"
  s.license       = "MIT"
  s.files         = `git ls-files -z`.split("\x0")
  s.test_files    = `git ls-files -z -- {test,spec,features}/*`.split("\x0")
  s.require_paths = ["lib"]
  s.add_dependency "activesupport", ">= 3.0", "< 6.0"
  s.add_development_dependency "bundler",   "~> 1.7"
end
