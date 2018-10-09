# encoding: UTF-8
# frozen_string_literal: true

require 'regexp-match-polyfill' if RUBY_VERSION < '2.4'
require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/hash/keys'
require 'active_support/core_ext/hash/indifferent_access'

class Hash
  unless method_defined?(:camelize)
    def camelize(first_letter = :upper)
      dup.camelize!(first_letter)
    end
  end

  unless method_defined?(:camelize!)
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

  unless method_defined?(:deep_with_indifferent_access)
    def deep_with_indifferent_access
      each_with_object({}) do |(k, v), m|
        m[k] = v.respond_to?(:deep_with_indifferent_access) ? v.deep_with_indifferent_access : v
      end.with_indifferent_access
    end
  end
end

class Array
  unless method_defined?(:deep_with_indifferent_access)
    def deep_with_indifferent_access
      map { |item| item.respond_to?(:deep_with_indifferent_access) ? item.deep_with_indifferent_access : item }
    end
  end

  unless method_defined?(:deep_symbolize_keys)
    def deep_symbolize_keys
      map { |item| item.respond_to?(:deep_symbolize_keys) ? item.deep_symbolize_keys : item }
    end
  end

  unless method_defined?(:deep_stringify_keys)
    def deep_stringify_keys
      map { |item| item.respond_to?(:deep_stringify_keys) ? item.deep_stringify_keys : item }
    end
  end
end
