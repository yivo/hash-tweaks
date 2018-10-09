# encoding: UTF-8
# frozen_string_literal: true

require "rake/testtask"

ENV["TESTOPTS"] = "--verbose"
Rake::TestTask.new { |t| t.libs << "test" }
task default: :test
