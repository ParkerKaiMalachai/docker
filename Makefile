ENV ?= dev
COMPOSE_FILE = docker-compose.$(ENV).yaml


create:
	docker run --rm \
	-v app-volume:/data \
	-v backup-volume:/backup \
	alpine \
	sh -c "tar cvf /backup/backup.tar -C /data ."

restore:
	docker run --rm \
	-v app-volume:/data \
	-v backup-volume:/backup \
	alpine \
	sh -c "tar xvf /backup/backup.tar -C /data"


build:
	docker compose -f $(COMPOSE_FILE) up --build
start: 
	docker compose -f $(COMPOSE_FILE) up -d
down:
	docker compose -f $(COMPOSE_FILE) down
