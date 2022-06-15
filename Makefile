init:
	docker-compose build

start:
	docker-compose up

stop:
	docker-compose down

get_deps:
	docker-compose run --rm phoenix mix deps.get

setup_db:
	docker-compose up -d db
	docker-compose run --rm phoenix mix ecto.setup

run_test:
	docker-compose run -e MIX_ENV=test --rm phoenix mix test $(filter-out $@,$(MAKECMDGOALS))

credo:
	docker-compose run --rm phoenix mix credo --strict

format:
	docker-compose run --rm phoenix mix format

update:
	docker-compose run --rm phoenix mix deps.update $(filter-out $@,$(MAKECMDGOALS))
