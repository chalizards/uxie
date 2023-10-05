# frozen_string_literal: true

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

  describe 'calculate_dates' do
    it 'returns 43 dates when date unit is daily' do
      plan = Plan.new('beginner')

      dates = plan.calculate_dates(:daily)

      expect(dates.count).to eq(43)
    end

    it 'returns 12 dates when date unit is monthly' do
      plan = Plan.new('pro')

      dates = plan.calculate_dates(:monthly)

      expect(dates.count).to eq(12)
    end

    it 'returns 7 dates when date unit is yearly' do
      plan = Plan.new('ultra')

      dates = plan.calculate_dates(:yearly)

      expect(dates.count).to eq(7)
    end
  end

  describe 'get_beginner_dates' do
    it 'returns 43 dates when plan is beginner' do
      plan = Plan.new('beginner')

      dates = plan.get_beginner_dates

      expect(dates.count).to eq(43)
    end

    describe 'get_pro_dates' do
      it 'returns 55 dates when plan is pro' do
        plan = Plan.new('pro')

        dates = plan.get_pro_dates

        expect(dates.count).to eq(55)
      end
    end

    describe 'get_ultra_dates' do
      it 'returns 62 dates when plan is ultra' do
        plan = Plan.new('ultra')

        dates = plan.get_ultra_dates

        expect(dates.count).to eq(62)
      end
    end
  end
end