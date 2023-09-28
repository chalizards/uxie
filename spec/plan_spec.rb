# frozen_string_literal: true

RSpec.describe 'Plan' do
  require 'plan'
  require 'date'

  context 'calculate_plan_days' do
    date = '2023-09-27'

    it 'returns 42 days for beginner plan' do
      plan = Plan.new('beginner', date)

      expect(plan.calculate_plan_days).to eq(42)
    end

    it 'returns 408 days for pro plan' do
      plan = Plan.new('pro', date)

      expect(plan.calculate_plan_days).to eq(408)
    end

    it 'returns 2964 days for ultra plan' do
      plan = Plan.new('ultra', date)

      expect(plan.calculate_plan_days).to eq(2964)
    end
  end
end
