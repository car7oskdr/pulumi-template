SHELL=/bin/bash

include .makefiles/install.mk
include .makefiles/linteo.mk
include .makefiles/pulumi.mk

# Default target
help:
	@echo "Comandos disponibles:"
	@echo "  install ---------- Instala dependencias con uv"
	@echo "  lint ------------- Ejecuta linting"
	@echo "  pulumi-up -------- Ejecuta Pulumi Up"
	@echo "  pulumi-view ------ Ejecuta Pulumi Preview"
	@echo "  pulumi-rm ------- Ejecuta Pulumi Destroy"
