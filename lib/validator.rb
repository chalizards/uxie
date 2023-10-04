# frozen_string_literal: true

module Validator
  PLANS = %i[beginner pro ultra].freeze

  def check_plan_name(plan_name)
    plan_name = format_plan_name(plan_name)

    raise ArgumentError, 'Invalid plan name' unless valid_plan_name?(plan_name)

    plan_name
  end

  def format_plan_name(plan_name)
    plan_name = plan_name.downcase
    plan_name.to_sym
  end

  def valid_plan_name?(plan_name)
    PLANS.include?(plan_name)
  end

  module_function :check_plan_name, :format_plan_name, :valid_plan_name?
end
