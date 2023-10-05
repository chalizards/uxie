# frozen_string_literal: true

require_relative 'lib/backup_manager'
require_relative 'lib/plan'

plan_name, user_date = ARGV

response = BackupManager.new(plan_name, user_date).keep_backup?

puts response
