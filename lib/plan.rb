# frozen_string_literal: true

require 'date'
require_relative 'validator'

# The Plan class calculates dates based on the chosen plan type (beginner, pro, ultra).
class Plan
  attr_reader :name

  PLAN_DAYS = 42 + 1
  PLAN_MONTHS = 12
  PLAN_YEARS = 7

  def initialize(name)
    @name = Validator.check_plan_name(name)
  end

  def calculate_beginner_dates
    calculate_dates(:daily)
  end

  def calculate_pro_dates
    daily = calculate_dates(:daily)
    monthly = calculate_dates(:monthly)

    daily + monthly
  end

  def calculate_ultra_dates
    daily = calculate_dates(:daily)
    monthly = calculate_dates(:monthly)
    yearly = calculate_dates(:yearly)

    daily + monthly + yearly
  end

  private

  def calculate_dates(date_unit)
    date = Date.today
    dates = []

    case date_unit
    when :daily
      calculate_daily_dates(date, dates)
    when :monthly
      calculate_monthly_dates(date, dates)
    when :yearly
      calculate_yearly_dates(date, dates)
    end
  end

  def end_calc?(dates, date_unit)
    cond = {
      daily: dates.count == PLAN_DAYS,
      monthly: dates.count == PLAN_MONTHS,
      yearly: dates.count == PLAN_YEARS
    }

    cond[date_unit]
  end

  def calculate_daily_dates(date, dates)
    return dates if end_calc?(dates, :daily)

    dates << date
    last_date = date - 1

    calculate_daily_dates(last_date, dates)
  end

  def calculate_monthly_dates(date, dates)
    return dates if end_calc?(dates, :monthly)

    last_date = date >> -1
    last_day_of_month_date = Date.new(last_date.year, last_date.month, -1)

    dates << last_day_of_month_date

    calculate_monthly_dates(last_day_of_month_date, dates)
  end

  def calculate_yearly_dates(date, dates)
    return dates if end_calc?(dates, :yearly)

    last_year = date.year - 1
    last_year_date = Date.new(last_year, 12, 31)
    dates << last_year_date

    calculate_yearly_dates(last_year_date, dates)
  end
end
