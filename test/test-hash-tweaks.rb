# encoding: UTF-8
# frozen_string_literal: true

require_relative "helper"

class HashTweaksTest < Test::Unit::TestCase
  test "Hash#camelize" do
    assert_equal({ fooBarBaz: "qux" }, { foo_bar_baz: "qux" }.camelize(:lower))
    assert_equal({ FooBarBaz: "qux" }, { foo_bar_baz: "qux" }.camelize(:upper))
    assert_equal({ FOO_BAZ_BAZ: "qux" }, { FOO_BAZ_BAZ: "qux" }.camelize(:upper))
  end

  test "Hash#camelize!" do
    hash = { foo_bar_baz: "qux" }
    hash.camelize!
    assert_equal [:FooBarBaz], hash.keys
  end

  test "Hash#deep_with_indifferent_access" do
    hash_1 = { a: { "b" => { c: "d" } } }
    hash_2 = hash_1.deep_with_indifferent_access
    assert_equal JSON.generate(hash_1[:a]), JSON.generate(hash_2["a"])
    assert_equal JSON.generate(hash_1[:a]), JSON.generate(hash_2[:a])
    assert_equal JSON.generate(hash_1[:a]["b"]), JSON.generate(hash_2["a"]["b"])
    assert_equal JSON.generate(hash_1[:a]["b"]), JSON.generate(hash_2["a"][:b])
    assert_equal JSON.generate(hash_1[:a]["b"][:c]), JSON.generate(hash_2["a"][:b][:c])
    assert_equal JSON.generate(hash_1[:a]["b"][:c]), JSON.generate(hash_2["a"][:b]["c"])
  end

  test "Array#deep_with_indifferent_access" do
    array = [:foo, "baz", { a: { "b" => :c } }].deep_with_indifferent_access
    assert_equal :foo, array[0]
    assert_equal "baz", array[1]
    assert_equal JSON.generate(a: { b: :c }), JSON.generate(array[2])
    assert_equal JSON.generate(b: :c), JSON.generate(array[2][:a])
    assert_equal JSON.generate(b: :c), JSON.generate(array[2]["a"])
    assert_equal :c, array[2][:a]["b"]
    assert_equal :c, array[2]["a"][:b]
  end

  test "Array#deep_symbolize_keys" do
    assert_equal([{ foo: "bar" }, "baz", :baz], [{ "foo" => "bar" }, "baz", :baz].deep_symbolize_keys)
  end

  test "Array#deep_stringify_keys" do
    assert_equal([{ "foo" => :bar }, "baz", :baz], [{ foo: :bar }, "baz", :baz].deep_stringify_keys)
  end
end
