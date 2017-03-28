# encoding: UTF-8
# frozen_string_literal: true

require 'bundler'
Bundler.require :default, :development, :test

class HashTweaksTest < Test::Unit::TestCase
  def test_camelize
    assert_equal({fooBarBaz: 'qux'}, {foo_bar_baz: 'qux'}.camelize(:lower))
    assert_equal({FooBarBaz: 'qux'}, {foo_bar_baz: 'qux'}.camelize(:upper))
    assert_equal({FOO_BAZ_BAZ: 'qux'}, {FOO_BAZ_BAZ: 'qux'}.camelize(:upper))
  end
end
