# frozen_string_literal: true

# Calculate the yearly dates
module Year
  require 'date'

  YEARS = 7

  def calculate_yearly_dates(date, dates)
    return dates if end_calc?(dates)

    last_year = date.year - 1
    last_year_date = Date.new(last_year, 12, 31)
    dates << last_year_date

    calculate_yearly_dates(last_year_date, dates)
  end

  private

  def end_calc?(dates)
    dates.count == YEARS
  end

  module_function :calculate_yearly_dates, :end_calc?
end
