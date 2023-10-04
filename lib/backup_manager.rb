# frozen_string_literal: true

require 'date'
require_relative 'validator'

class BackupManager
  attr_reader :plan, :user_date

  def initialize(plan_name, date)
    @plan = Plan.new(plan_name)
    @user_date = Date.parse(date)
  end

  def keep_backup?
    dates = get_plan_dates

    dates.include?(@user_date)
  end

  private

  def get_plan_dates
    plan_dates = { beginner: -> { @plan.get_beginner_dates },
                   pro: -> { @plan.get_pro_dates },
                   ultra: -> { @plan.get_ultra_dates } }

    plan_dates[@plan.name].call
  end
end
