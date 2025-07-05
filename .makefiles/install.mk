init_venv:
	@echo "Inicializando venv con uv"
	@( \
		./scripts/install_uv.sh; \
	)

init_pulumi:
	@echo "Inicializando Pulumi"
	@( \
		./scripts/setup-pulumi.sh; \
	)

create_subdirectories:
	@echo ""
	@echo "Creando subdirectorios"
	@( \
		mkdir -p {cov,.sonar,.scannerwork}; \
	)

install: init_venv init_pulumi create_subdirectories

activa-venv:
	$(MAKE) init_venv
	@echo ""
	@echo "Activando venv"
	@( \
		source .venv/bin/activate; \
		echo "venv activado..."; \
	)
	$(MAKE) create_subdirectories
