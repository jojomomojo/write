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
	
config:
	docker-compose run --rm write -w /appr/src/write write bash
