FROM odoo:18.0

ENV ODOO_RC=/etc/odoo/odoo.conf

USER root

# Copia para local seguro com permissão e executa chmod
COPY ./entrypoint.sh /entrypoint.sh
RUN  chmod +x /entrypoint.sh && \
     chown odoo:odoo /entrypoint.sh && \
     chmod 755 /entrypoint.sh
EXPOSE 8069 8071 8072

USER odoo

ENTRYPOINT ["/entrypoint.sh"]
CMD ["odoo", "--config=/etc/odoo/odoo.conf"]
