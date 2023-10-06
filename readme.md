# README
## Running the code
### Starting the Container
```
docker compose up -d
docker exec -ti uxie /bin/bash
```
### Using the Uxie script
- Execute the Uxie script by providing the plan name and the desired date as arguments:
```
ruby uxie_script.rb "beginner" "2023-10-03"
```
### Running the tests

```
rspec -fd
```
- The `spec/lib/backup_manager_spec.rb` file contains tests for all dates listed in the table below:
  
| Date       | Beginner   | Pro        | Ultra     |
|------------|------------|------------|-----------|
| 2023-10-03 | retain ✅   | retain ✅   | retain ✅  |
| 2023-08-22 | retain ✅   | retain ✅   | retain ✅  |
| 2023-08-21 | delete ❌   | delete ❌   | delete ❌  |
| 2023-07-31 | delete ❌   | retain ✅   | retain ✅  |
| 2023-06-30 | delete ❌   | retain ✅   | retain ✅  |
| 2022-12-31 | delete ❌   | retain ✅   | retain ✅  |
| 2022-10-31 | delete ❌   | retain ✅   | retain ✅  |
| 2022-09-30 | delete ❌   | delete ❌   | delete ❌  |
| 2021-12-31 | delete ❌   | delete ❌   | retain ✅  |
| 2021-12-30 | delete ❌   | delete ❌   | delete ❌  |
| 2016-12-31 | delete ❌   | delete ❌   | retain ✅  |
| 2015-12-31 | delete ❌   | delete ❌   | delete ❌  |


![uxie](https://cdn.cardsrealm.com/images/cartas/sm6-forbidden-light/en/crop-med/uxie-41131-41.jpeg?5202)