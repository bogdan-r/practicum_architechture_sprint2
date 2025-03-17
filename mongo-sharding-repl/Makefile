.PHONY: init-mongo

init-mongo:
	@echo "Initializing MongoDB sharding..."
	@chmod +x scripts/mongo-init.sh scripts/mongo-init-router.sh
	@./scripts/mongo-init.sh
	@sleep 5
	@./scripts/mongo-init-router.sh
	@echo "MongoDB sharding initialization completed"
