# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'spec_helper'

RSpec.describe 'BackupManager' do
  describe 'keep_backup? for all dates in the output example' do
    let(:today) { Date.parse('2023-10-03') }

    before do
      allow(Date).to receive(:today).and_return(today)
    end

    context 'when plan is beginner' do
      dates = [
        { date: '2023-10-03', response: true },
        { date: '2023-08-22', response: true },
        { date: '2023-08-21', response: false },
        { date: '2023-07-31', response: false },
        { date: '2023-06-30', response: false },
        { date: '2022-12-31', response: false },
        { date: '2022-10-31', response: false },
        { date: '2022-09-30', response: false },
        { date: '2021-12-31', response: false },
        { date: '2021-12-30', response: false },
        { date: '2016-12-31', response: false },
        { date: '2015-12-31', response: false }
      ]

      dates.each do |data|
        it "returns #{data[:response]} for #{data[:date]}" do
          response = BackupManager.new('beginner', data[:date]).keep_backup?
          expect(response).to eq(data[:response])
        end
      end
    end

    context 'when plan is pro' do
      dates = [
        { date: '2023-10-03', response: true },
        { date: '2023-08-22', response: true },
        { date: '2023-08-21', response: false },
        { date: '2023-07-31', response: true },
        { date: '2023-06-30', response: true },
        { date: '2022-12-31', response: true },
        { date: '2022-10-31', response: true },
        { date: '2022-09-30', response: false },
        { date: '2021-12-31', response: false },
        { date: '2021-12-30', response: false },
        { date: '2016-12-31', response: false },
        { date: '2015-12-31', response: false }
      ]

      dates.each do |data|
        it "returns #{data[:response]} for #{data[:date]}" do
          response = BackupManager.new('pro', data[:date]).keep_backup?

          expect(response).to eq(data[:response])
        end
      end
    end

    context 'when plan is ultra' do
      dates = [
        { date: '2023-10-03', response: true },
        { date: '2023-08-22', response: true },
        { date: '2023-08-21', response: false },
        { date: '2023-07-31', response: true },
        { date: '2023-06-30', response: true },
        { date: '2022-12-31', response: true },
        { date: '2022-10-31', response: true },
        { date: '2022-09-30', response: false },
        { date: '2021-12-31', response: true },
        { date: '2021-12-30', response: false },
        { date: '2016-12-31', response: true },
        { date: '2015-12-31', response: false }
      ]

      dates.each do |data|
        it "returns #{data[:response]} for #{data[:date]}" do
          response = BackupManager.new('ultra', data[:date]).keep_backup?

          expect(response).to eq(data[:response])
        end
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
