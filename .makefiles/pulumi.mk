pulumi-up:
	@echo "Ejecutando Pulumi Up"
	@( \
		./pulumi/scripts/deploy-pulumi.sh; \
	)

pulumi-view:
	@echo "Ejecutando Pulumi Preview"
	@( \
		./pulumi/scripts/preview-pulumi.sh; \
	)

pulumi-rm:
	@echo "Ejecutando Pulumi Destroy"
	@( \
		./pulumi/scripts/destroy-pulumi.sh; \
	)
