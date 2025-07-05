#!/bin/bash

set -euo pipefail
trap 'echo "Error at line $LINENO: $BASH_COMMAND"' ERR

echo "==== Verificando Pulumi ===="

echo ">> CI variable PULUMI_ACCESS_TOKEN = '${PULUMI_ACCESS_TOKEN:-<empty>}'"

if ! command -v pulumi &> /dev/null; then
  echo "⚠️  Pulumi no está instalado. Instalando..."
  curl -fsSL https://get.pulumi.com/ | bash
  export PATH=$PATH:$HOME/.pulumi/bin
else
  echo "✅ Pulumi ya está instalado: $(pulumi version)"
fi

echo "==== Verificando si existe .env ===="

if [ -f .env ]; then
  source .env
fi

echo "==== Verificando PULUMI_ACCESS_TOKEN ===="

if [ -z "${PULUMI_ACCESS_TOKEN:-}" ]; then
  echo "❌ Error: PULUMI_ACCESS_TOKEN no está definido."
  echo "Si estas en tu máquina local, por favor, copia el archivo .env.local a .env y configura PULUMI_ACCESS_TOKEN"
  echo "Si estas ejecutando un pipeline en Gitlab o GitHub, por favor, configura PULUMI_ACCESS_TOKEN"
  exit 1
fi

echo "✅ Pulumi setup completo"
