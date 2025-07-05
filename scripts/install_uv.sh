#!/bin/bash

set -euo pipefail
trap 'echo "Error en línea $LINENO: $BASH_COMMAND"' ERR

echo "==== Comprobando uv ===="
if ! command -v uv &> /dev/null; then
  echo "⚠️  uv no está instalado."
  curl -Ls https://astral.sh/uv/install.sh | bash
  export PATH="$HOME/.cargo/bin:$PATH"
  echo "✅ uv instalado."
fi

echo "==== Comprobando Python 3.12 ===="
if command -v python3.12 &>/dev/null; then
  echo "✅ Python 3.12 encontrado: $(python3.12 --version)"
else
  uv python install 3.12
fi

echo "==== Creando .venv con uv ===="
if [ ! -d .venv ]; then
  uv venv --python 3.12
else
  echo "✅ .venv ya existe."
fi

echo "==== Activando y mostrando Python ===="
source .venv/bin/activate
echo "Python en uso: $(python --version)"
echo "Ubicación Python: $(which python)"
deactivate

echo "==== Instalando dependencias ===="
uv pip install -e .[dev]

echo "✅ uv setup completo."
