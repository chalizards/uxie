# frozen_string_literal: true

require 'plans'

RSpec.describe 'Plans' do
  context 'calculate_plan_days' do
    it 'returns 42 days for beginner plan' do
      plan = Plans.new

      expect(plan.calculate_plan_days('beginner', '2023-09-27')).to eq(42)
    end

    it 'returns 408 days for pro plan' do
      plan = Plans.new

      expect(plan.calculate_plan_days('pro', '2023-09-27')).to eq(408)
    end

    it 'returns 2964 days for ultra plan' do
      plan = Plans.new

      expect(plan.calculate_plan_days('ultra', '2023-09-27')).to eq(2964)
    end
  end
end
