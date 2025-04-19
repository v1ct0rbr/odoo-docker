#!/bin/bash

# Garante que o arquivo de configuração exista
if [ ! -f "$ODOO_RC" ]; then
    echo "Creating Odoo configuration file at $ODOO_RC"
    touch "$ODOO_RC"
fi

# adicione as configuracoes de banco de dados
# Define o banco de dados com base nas variáveis de ambiente

if grep -q "^db_host" "$ODOO_RC"; then
    sed -i "s/^db_host.*/db_host = $POSTGRES_HOST/" "$ODOO_RC"
else
    echo "db_host = $POSTGRES_HOST" >> "$ODOO_RC"
fi
if grep -q "^db_user" "$ODOO_RC"; then
    sed -i "s/^db_user.*/db_user = $POSTGRES_USER/" "$ODOO_RC"
else
    echo "db_user = $POSTGRES_USER" >> "$ODOO_RC"
fi
if grep -q "^db_password" "$ODOO_RC"; then
    sed -i "s/^db_password.*/db_password = $POSTGRES_PASSWORD/" "$ODOO_RC"
else
    echo "db_password = $POSTGRES_PASSWORD" >> "$ODOO_RC"
fi
if grep -q "^db_name" "$ODOO_RC"; then
    sed -i "s/^db_name.*/db_name = $POSTGRES_DB/" "$ODOO_RC"
else
    echo "db_name = $POSTGRES_DB" >> "$ODOO_RC"
fi



# Define o timezone com base na variável de ambiente TZ

# Define o proxy_mode com base na variável de ambiente PROXY_MODE
# Se a linha com proxy_mode já existir, ela será substituída
if grep -q "^proxy_mode" "$ODOO_RC"; then
    sed -i "s/^proxy_mode.*/proxy_mode = $PROXY_MODE/" "$ODOO_RC"
else
    echo "proxy_mode = $PROXY_MODE" >> "$ODOO_RC"
fi

# Executa o comando original (ex: odoo ...)
exec "$@"