# frozen_string_literal: true

require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new(:spec) do |task|
  task.pattern = 'spec/**/*_spec.rb'
end

RuboCop::RakeTask.new(:rubocop) do |task|
  task.patterns = ['**/*.rb']
end

task default: [:spec]
