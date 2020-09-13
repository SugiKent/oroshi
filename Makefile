.PHONY: start
start:
	docker-compose -f docker-compose.yml up --build

.PHONY: import
import:
	curl -XDELETE "http://localhost:9200/mysql-*?pretty"
	docker-compose -f docker-compose-logstash.yml up --build

.PHONY: prune
prune:
	docker system prune -a --volumes
