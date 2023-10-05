# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
require 'spec_helper'

RSpec.describe 'Plan' do
  describe 'initialize' do
    context 'when plan name is valid' do
      it 'returns Plan object' do
        plan_name = 'beginner'

        plan = Plan.new('beginner')

        expect(plan).to be_a(Plan)
        expect(plan.name).to eq(plan_name.to_sym)
      end
    end

    context 'when plan name is invalid' do
      it 'returns ArgumentError' do
        plan_name = 'begginner'

        expect { Plan.new(plan_name) }.to raise_error(ArgumentError)
      end
    end
  end

  describe 'calculate_beginner_dates' do
    it 'returns 43 dates when plan is beginner' do
      plan = Plan.new('beginner')

      dates = plan.calculate_beginner_dates

      expect(dates.count).to eq(43)
    end

    describe 'calculate_pro_dates' do
      it 'returns 55 dates when plan is pro' do
        plan = Plan.new('pro')

        dates = plan.calculate_pro_dates

        expect(dates.count).to eq(55)
      end
    end

    describe 'calculate_ultra_dates' do
      it 'returns 62 dates when plan is ultra' do
        plan = Plan.new('ultra')

        dates = plan.calculate_ultra_dates

        expect(dates.count).to eq(62)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
