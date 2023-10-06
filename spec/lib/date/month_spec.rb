# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Month' do
  describe 'calculate_daily_dates' do
    it 'returns 12 dates' do
      date = Date.parse('2023-10-03')

      dates = Month.calculate_monthly_dates(date, [])

      expect(dates.count).to eq(12)
    end
  end
end
