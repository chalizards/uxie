# frozen_string_literal: true

require 'date'
require_relative 'validator'

# BackupManager is a class responsible for managing backup plans.
# It initializes with a plan name and a user-defined date and provides
# a method to determine whether the backup should be kept on the given date.
class BackupManager
  attr_reader :plan, :user_date

  def initialize(plan_name, date)
    @plan = Plan.new(plan_name)
    @user_date = Date.parse(date)
  end

  def keep_backup?
    dates = plan_dates

    dates.include?(@user_date)
  end

  private

  def plan_dates
    plan_dates = { beginner: -> { @plan.calculate_beginner_dates },
                   pro: -> { @plan.calculate_pro_dates },
                   ultra: -> { @plan.calculate_ultra_dates } }
    plan_dates[@plan.name].call
  end
end
