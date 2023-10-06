# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Day' do
  describe 'calculate_daily_dates' do
    it 'returns 43 dates' do
      date = Date.parse('2023-10-03')

      dates = Day.calculate_daily_dates(date, [])

      expect(dates.count).to eq(43)
    end
  end
end
