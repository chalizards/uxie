# frozen_string_literal: true

require_relative 'lib/backup_manager'
require_relative 'lib/plan'

plan_name, user_date, plan_start_date = ARGV

backup = BackupManager.new(plan_name, user_date, plan_start_date)
backup.expired?
