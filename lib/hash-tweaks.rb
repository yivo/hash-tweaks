# encoding: UTF-8
# frozen_string_literal: true

require 'regexp-match-polyfill' if RUBY_VERSION < '2.4'
require 'active_support/core_ext/string/inflections'

module HashTweaks
  module Camelize
    def camelize(first_letter = :upper)
      dup.camelize!(first_letter)
    end

    def camelize!(first_letter = :upper)
      keys.each do |key|
        # Check if key is symbol or string and if it is not CONSTANT_VARIABLE.
        if (Symbol === key || String === key) && !key.match?(/\A[A-Z_][A-Z_0-9]*\z/)
          new_key = (Symbol === key ? key.to_s : key).camelize(first_letter)
          self[Symbol === key ? new_key.to_sym : new_key] = self.delete(key)
        end
      end
      self
    end
  end
end

Hash.include HashTweaks::Camelize
