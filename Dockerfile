FROM odoo:18.0

ENV ODOO_RC=/etc/odoo/odoo.conf


# Copia para local seguro com permissão e executa chmod
COPY ./docker/entrypoint.sh /entrypoint.sh

EXPOSE 8069 8071 8072

ENTRYPOINT ["/entrypoint.sh"]
CMD ["odoo", "--config=/etc/odoo/odoo.conf"]
