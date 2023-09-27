# frozen_string_literal: true

require 'backup_manager'

RSpec.describe 'BackupManager' do
  context 'expired?' do
    it 'returns false when inputed date is under expiration date' do
      input_date = '2023-09-27'

      allow(Date).to receive(:today).and_return(input_date)

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
