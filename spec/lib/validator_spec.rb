# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Validator' do
  describe 'check_plan_name' do
    it 'returns a valid plan name' do
      plan_name = 'beginner'
      plan_name_sym = :beginner
      result = Validator.check_plan_name(plan_name)
      expect(result).to eq(plan_name_sym)
    end
    it 'returns invalid plan name error' do
      plan_name = 'begginner'
      expect { Validator.check_plan_name(plan_name) }.to raise_error(ArgumentError)
    end
  end
end
