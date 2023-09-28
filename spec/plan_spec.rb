# frozen_string_literal: true

RSpec.describe 'Plan' do
  require 'plan'
  require 'date'

  context 'initialize' do
    it 'returns Plan object when plan_name is valid' do
      plan_name = 'beginner'
      plan_start_date = '2023-09-27'

      plan = Plan.new('beginner', '2023-09-27')
      expect(plan).to be_a(Plan)
      expect(plan.plan_name).to eq(plan_name.to_sym)
      expect(plan.start_date).to eq(Date.parse(plan_start_date))
    end

    it 'returns ArgumentError when plan_name is invalid' do
      plan_name = 'begginner'
      plan_start_date = '2023-09-27'

      expect { Plan.new(plan_name, plan_start_date) }.to raise_error(ArgumentError)
    end
  end

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
