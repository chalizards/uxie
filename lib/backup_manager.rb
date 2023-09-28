# frozen_string_literal: true

class BackupManager
  require 'date'

  def initialize(plan_name, user_date, plan_start_date = nil)
    @plan = Plan.new(plan_name, plan_start_date)
    @user_date = Date.parse(user_date)
  end

  def expired?
    validate_arguments

    plan_days = @plan.calculate_plan_days

    expiration_date = @plan.start_date + plan_days

    @user_date > expiration_date
  end

  private

  def invalid_date?
    @user_date < @plan.start_date
  end

  def validate_arguments
    return unless invalid_date?

    raise ArgumentError, 'User date must be after plan start date'
  end
end
