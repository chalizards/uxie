# frozen_string_literal: true

require 'date'

# Calculate the daily dates
module Day
  DAYS = 42 + 1

  def calculate_daily_dates(date, dates)
    return dates if end_calc?(dates)

    dates << date
    last_date = date - 1

    calculate_daily_dates(last_date, dates)
  end

  private

  def end_calc?(dates)
    dates.count == DAYS
  end

  module_function :calculate_daily_dates, :end_calc?
end
