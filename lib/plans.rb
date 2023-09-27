# frozen_string_literal: true

require 'date'

class Plans
  PLAN_DAYS = 42
  PLAN_MONTHS = 12
  PLAN_YEARS = 7

  def calculate_plan_days(plan_name, start_date)
    plan_in_days(plan_name, start_date)
  end

  def plans
    { beginner: { days: PLAN_DAYS, months: 0, years: 0 },
      pro: { days: PLAN_DAYS, months: PLAN_MONTHS, years: 0 },
      ultra: { days: PLAN_DAYS, months: PLAN_MONTHS, years: PLAN_YEARS } }
  end

  private

  def plan_in_days(plan_name, start_date)
    Date.parse(start_date)
    plan_name_sym = plan_name.to_sym
    plan = plans[plan_name_sym]

    days = plan[:days]
    months = plan[:months]
    years = plan[:years]

    years_in_months = years_to_months(years)
    total_months = months + years_in_months
    months_in_days = months_to_days(start_date, total_months)

    days + months_in_days
  end

  def years_to_months(years)
    years * 12
  end

  def months_to_days(start_date, months)
    start_date = Date.parse(start_date)

    date = start_date >> months

    (date - start_date).to_i
  end
end
