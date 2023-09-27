# frozen_string_literal: true

require 'date'
require 'plans'
require 'pry'

class BackupManager
  def initialize(plan, date, start_date = nil)
    @plan = plan
    @start_date = start_date || Date.today.to_s
    @date = date
  end

  def expired?
    plan = Plans.new
    plan_days = plan.calculate_plan_days(@plan, @start_date)

    start_date = Date.parse(@start_date)
    user_input_date = Date.parse(@date)

    expiration_date = start_date + plan_days

    user_input_date > expiration_date
  end
end
