# frozen_string_literal: true

# Calculate the monthly dates
module Month
  require 'date'

  MONTHS = 12

  def calculate_monthly_dates(date, dates)
    return dates if end_calc?(dates)

    last_date = date >> -1
    last_day_of_month_date = Date.new(last_date.year, last_date.month, -1)

    dates << last_day_of_month_date

    calculate_monthly_dates(last_day_of_month_date, dates)
  end

  private

  def end_calc?(dates)
    dates.count == MONTHS
  end

  module_function :calculate_monthly_dates, :end_calc?
end
