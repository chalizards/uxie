# frozen_string_literal: true

RSpec.describe 'BackupManager' do
  require 'backup_manager'
  require 'plan'

  context 'expired?' do
    it 'returns false when inputed date is under expiration date' do
      plan_start_date = Date.parse('2023-09-27')
      input_date = '2023-09-27'

      allow(Date).to receive(:today).and_return(plan_start_date)

      backup = BackupManager.new('beginner', input_date)

      expect(backup.expired?).to eq(false)
    end

    it 'returns true when inputed date is greater expiration date' do
      expiration_date = Date.parse('2023-09-27') - 42
      input_date = '2023-09-28'

      allow(Date).to receive(:today).and_return(expiration_date)

      backup = BackupManager.new('beginner', input_date)

      expect(backup.expired?).to eq(true)
    end
  end
end
