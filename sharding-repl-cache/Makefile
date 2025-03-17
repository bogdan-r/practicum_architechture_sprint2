.PHONY: init-mongo

init-mongo:
	@echo "Initializing MongoDB sharding..."
	@./scripts/mongo-init-replicas.sh
	@echo "Waiting for MongoDB replicas to be ready..."
	@timeout=60; interval=5; while [ $$timeout -gt 0 ]; do \
		./scripts/mongo-init-router.sh && break || echo "Retrying in $$interval seconds..."; \
		sleep $$interval; \
		timeout=$$((timeout - interval)); \
	done
	@echo "MongoDB sharding initialization completed"
