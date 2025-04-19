#!/bin/bash

# Garante que o arquivo de configuração exista
if [ ! -f "$ODOO_RC" ]; then
    echo "Creating Odoo configuration file at $ODOO_RC"
    touch "$ODOO_RC"
fi

# Define o proxy_mode com base na variável de ambiente PROXY_MODE
# Se a linha com proxy_mode já existir, ela será substituída
if grep -q "^proxy_mode" "$ODOO_RC"; then
    sed -i "s/^proxy_mode.*/proxy_mode = $PROXY_MODE/" "$ODOO_RC"
else
    echo "proxy_mode = $PROXY_MODE" >> "$ODOO_RC"
fi

# Executa o comando original (ex: odoo ...)
exec "$@"