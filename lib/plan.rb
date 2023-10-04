# frozen_string_literal: true

require 'date'
require_relative 'validator'

class Plan
  attr_reader :name

  PLAN_DAYS = 42
  PLAN_MONTHS = 12
  PLAN_YEARS = 7

  def initialize(name)
    @name = Validator.check_plan_name(name)
  end

  def get_beginner_dates
    calculate_beginner_dates
  end

  def get_pro_dates
    calculate_pro_dates
  end

  def get_ultra_dates
    calculate_ultra_dates
  end

  def calculate_dates(date_unit)
    date = Date.today
    dates = []

    calculate = {
      daily: lambda {
        calculate_daily_dates(date, dates)
      },
      monthly: lambda {
        calculate_monthly_dates(date, dates)
      },
      yearly: lambda {
        calculate_yearly_dates(date, dates)
      }
    }

    calculate[date_unit].call
  end

  private

  def calculate_daily_dates(date, dates)
    return dates if dates.count == PLAN_DAYS

    dates << date
    last_date = date - 1

    calculate_daily_dates(last_date, dates)
  end

  def calculate_monthly_dates(date, dates)
    return dates if dates.count == PLAN_MONTHS

    last_date = date >> -1
    last_day_of_month_date = Date.new(last_date.year, last_date.month, -1)

    dates << last_day_of_month_date

    calculate_monthly_dates(last_day_of_month_date, dates)
  end

  def calculate_yearly_dates(date, dates)
    return dates if dates.count == PLAN_YEARS

    last_year = date.year - 1
    last_year_date = Date.new(last_year, 12, 31)
    dates << last_year_date

    calculate_yearly_dates(last_year_date, dates)
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
end
