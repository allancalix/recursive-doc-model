.PHONY: all
all: start migrate

.PHONY: start
start:
	docker compose -f docker-compose.yaml up --force-recreate -d
	# Give Postgres time to start accepting connections.
	sleep 5

.PHONY: migrate
migrate:
	psql "postgres://admin:test123@localhost:5432" -f sql/init.sql

.PHONY: clean
clean:
	psql "postgres://admin:test123@localhost:5432" -f sql/cleanup.sql
	# Force skips confirmation prompt.
	docker compose -f docker-compose.yaml rm -f --stop
