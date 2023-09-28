# frozen_string_literal: true

class Plan
  require 'date'

  attr_reader :plan_name, :start_date

  PLAN_DAYS = 42
  PLAN_MONTHS = 12
  PLAN_YEARS = 7

  def initialize(plan_name, start_date)
    @plan_name = check_plan_name(plan_name)
    @start_date = check_plan_start_date(start_date)
  end

  def calculate_plan_days
    plan_duration_in_days
  end

  def plans
    { beginner: { days: PLAN_DAYS, months: 0, years: 0 },
      pro: { days: PLAN_DAYS, months: PLAN_MONTHS, years: 0 },
      ultra: { days: PLAN_DAYS, months: PLAN_MONTHS, years: PLAN_YEARS } }
  end

  private

  def check_plan_name(plan_name)
    plan_name = format_plan_name(plan_name)

    if valid_plan_name?(plan_name)
      plan_name
    else
      raise ArgumentError, 'Invalid plan name'
    end
  end

  def format_plan_name(plan_name)
    plan_name = plan_name.downcase
    plan_name_sym = plan_name.to_sym

    plan_name_sym
  end

  def valid_plan_name?(plan_name)
    plans.keys.include?(plan_name)
  end

  def check_plan_start_date(plan_start_date)
    if plan_start_date
      Date.parse(plan_start_date)
    else
      Date.today
    end
  end

  def plan_duration_in_days
    plan = plans[@plan_name]

    days = plan[:days]
    months = plan[:months]
    years = plan[:years]

    years_in_months = years_to_months(years)
    total_months = months + years_in_months
    months_in_days = months_to_days(@start_date, total_months)

    days + months_in_days
  end

  def years_to_months(years)
    years * 12
  end

  def months_to_days(start_date, months)
    date = start_date >> months

    (date - start_date).to_i
  end
end
