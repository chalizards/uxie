# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'BackupManager' do
  describe 'keep_backup?' do
    let(:date) { Date.parse('2023-10-03') }

    before do
      allow(Date).to receive(:today).and_return(date)
    end

    context 'when plan is beginner' do
      it 'returns true when date is in dates range' do
        response = BackupManager.new('beginner', '2023-10-03').keep_backup?

        expect(response).to eq(true)
      end

      it 'returns false when date is out of dates range' do
        response = BackupManager.new('beginner', '2023-06-30').keep_backup?

        expect(response).to eq(false)
      end
    end

    context 'when plan is pro' do
      it 'returns true when date is in dates range' do
        response = BackupManager.new('pro', '2023-07-31').keep_backup?

        expect(response).to eq(true)
      end

      it 'returns false when date is out of dates range' do
        response = BackupManager.new('pro', '2022-09-30').keep_backup?

        expect(response).to eq(false)
      end
    end

    context 'when plan is ultra' do
      it 'returns true when date is in dates range' do
        response = BackupManager.new('ultra', '2021-12-31').keep_backup?

        expect(response).to eq(true)
      end

      it 'returns false when date is out of dates range' do
        response = BackupManager.new('ultra', '2015-12-31').keep_backup?

        expect(response).to eq(false)
      end
    end
  end
end
