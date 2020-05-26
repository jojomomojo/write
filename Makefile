config:
	docker-compose exec -w /app/src/write write touch config.ini
	docker-compose exec -w /app/src/write write /usr/local/writefreely/writefreely keys gen
	docker-compose exec -w /app/src/write write /usr/local/writefreely/writefreely config start
