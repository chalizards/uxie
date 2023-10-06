# frozen_string_literal: true

require 'date'
require_relative 'validator'
require_relative 'date/day'
require_relative 'date/month'
require_relative 'date/year'

# The Plan class calculates dates based on the chosen plan type (beginner, pro, ultra).
class Plan
  attr_reader :name

  def initialize(name)
    @name = Validator.check_plan_name(name)
    @today = Date.today
  end

  def calculate_beginner_dates
    Day.calculate_daily_dates(@today, [])
  end

  def calculate_pro_dates
    daily = Day.calculate_daily_dates(@today, [])
    monthly = Month.calculate_monthly_dates(@today, [])

    daily + monthly
  end

  def calculate_ultra_dates
    daily = Day.calculate_daily_dates(@today, [])
    monthly = Month.calculate_monthly_dates(@today, [])
    yearly = Year.calculate_yearly_dates(@today, [])

    daily + monthly + yearly
  end
end
