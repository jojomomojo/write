build:
	docker-compose build

up:
	docker-compose up -d
	
down:
	docker-compose down
	
restart:
	docker-compose restart
	
recreate:
	$(MAKE) down
	$(MAKE) up

recycle:
	$(MAKE) build
	$(MAKE) recreate

logs:
	docker-compose logs -f
	
config:
	docker-compose exec -w /app/src/write write touch config.ini
	docker-compose exec -w /app/src/write write /usr/local/writefreely/writefreely config start
