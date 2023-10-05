# README
### Running the code
- call the uxie script, passing as argument the plan name and the date you want to check
```
ruby uxie_script.rb "beginner" "2023-10-03"
```


### Running the tests

```
rspec -fd
```


| Date       | Beginner                                 | Pro                                       | Ultra                                     | Response                                  |
|------------|------------------------------------------|------------------------------------------|------------------------------------------|-------------------------------------------|
| 2023-10-03 | `BackupManager.new('beginner', '2023-10-03').keep_backup?` | `BackupManager.new('pro', '2023-10-03').keep_backup?` | `BackupManager.new('ultra', '2023-10-03').keep_backup?` | :white_check_mark:, :white_check_mark:, :white_check_mark: |
| 2023-08-22 | `BackupManager.new('beginner', '2023-08-22').keep_backup?` | `BackupManager.new('pro', '2023-08-22').keep_backup?` | `BackupManager.new('ultra', '2023-08-22').keep_backup?` | :white_check_mark:, :white_check_mark:, :white_check_mark: |
| 2023-08-21 | `BackupManager.new('beginner', '2023-08-21').keep_backup?` | `BackupManager.new('pro', '2023-08-21').keep_backup?` | `BackupManager.new('ultra', '2023-08-21').keep_backup?` | :white_check_mark:, :x:, :x: |
| 2023-07-31 | `BackupManager.new('beginner', '2023-07-31').keep_backup?` | `BackupManager.new('pro', '2023-07-31').keep_backup?` | `BackupManager.new('ultra', '2023-07-31').keep_backup?` | :x:, :white_check_mark:, :white_check_mark: |
| 2023-06-30 | `BackupManager.new('beginner', '2023-06-30').keep_backup?` | `BackupManager.new('pro', '2023-06-30').keep_backup?` | `BackupManager.new('ultra', '2023-06-30').keep_backup?` | :x:, :white_check_mark:, :white_check mark: |
| 2022-12-31 | `BackupManager.new('beginner', '2022-12-31').keep_backup?` | `BackupManager.new('pro', '2022-12-31').keep_backup?` | `BackupManager.new('ultra', '2022-12-31').keep_backup?` | :x:, :white_check_mark:, :white_check_mark: |
| 2022-10-31 | `BackupManager.new('beginner', '2022-10-31').keep_backup?` | `BackupManager.new('pro', '2022-10-31').keep_backup?` | `BackupManager.new('ultra', '2022-10-31').keep_backup?` | :x:, :white_check_mark:, :white_check_mark: |
| 2022-09-30 | `BackupManager.new('beginner', '2022-09-30').keep_backup?` | `BackupManager.new('pro', '2022-09-30').keep_backup?` | `BackupManager.new('ultra', '2022-09-30').keep_backup?` | :x:, :x:, :x: |
| 2021-12-31 | `BackupManager.new('beginner', '2021-12-31').keep_backup?` | `BackupManager.new('pro', '2021-12-31').keep_backup?` | `BackupManager.new('ultra', '2021-12-31').keep_backup?` | :x:, :x:, :white_check_mark: |
| 2021-12-30 | `BackupManager.new('beginner', '2021-12-30').keep_backup?` | `BackupManager.new('pro', '2021-12-30').keep_backup?` | `BackupManager.new('ultra', '2021-12-30').keep_backup?` | :x:, :x:, :x: |
| 2016-12-31 | `BackupManager.new('beginner', '2016-12-31').keep_backup?` | `BackupManager.new('pro', '2016-12-31').keep_backup?` | `BackupManager.new('ultra', '2016-12-31').keep_backup?` | :x:, :x:, :white_check_mark: |
| 2015-12-31 | `BackupManager.new('beginner', '2015-12-31').keep_backup?` | `BackupManager.new('pro', '2015-12-31').keep_backup?` | `BackupManager.new('ultra', '2015-12-31').keep_backup?` | :x:, :x:, :x: |


![uxie](https://cdn.cardsrealm.com/images/cartas/sm6-forbidden-light/en/crop-med/uxie-41131-41.jpeg?5202)