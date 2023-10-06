# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Year' do
  describe 'calculate_daily_dates' do
    it 'returns 12 dates' do
      date = Date.parse('2023-10-03')

      dates = Year.calculate_yearly_dates(date, [])

      expect(dates.count).to eq(7)
    end
  end
end
