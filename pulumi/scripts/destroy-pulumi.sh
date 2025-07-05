#!/bin/bash
set -euo pipefail
trap 'echo "Error at line $LINENO: $BASH_COMMAND"' ERR

export PATH=$PATH:"$HOME/.pulumi/bin"
cd pulumi
source ../.venv/bin/activate

STACK=${PULUMI_STACK:-dev}
PROJECT=$(grep '^name:' Pulumi.yaml | awk '{print $2}')

echo "==== Stack: $STACK | Proyecto: $PROJECT ===="

# Crear o seleccionar stack
# 1) Crear o seleccionar sin error
if pulumi stack select "$STACK" >/dev/null 2>&1; then
  echo "✅ Destruyendo stack '$STACK'…"
else
  echo "❌ Stack '$STACK' no existe, no se puede destruir."
  exit 1
fi

echo "==== Ejecutando Destroy ===="
pulumi destroy --yes
