# frozen_string_literal: true

# The Validator module is responsible for validating plan data.
module Validator
  PLANS = %i[beginner pro ultra].freeze

  def check_plan_name(plan_name)
    plan_name = format_plan_name(plan_name)

    raise ArgumentError, 'Invalid plan name' unless valid_plan_name?(plan_name)

    plan_name
  end

  private

  def format_plan_name(plan_name)
    plan_name = plan_name.downcase
    plan_name.to_sym
  end

  def valid_plan_name?(plan_name)
    PLANS.include?(plan_name)
  end

  module_function :check_plan_name, :format_plan_name, :valid_plan_name?
end
