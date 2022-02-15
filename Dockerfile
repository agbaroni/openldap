FROM rockylinux:8

USER root

COPY slapd-setup.service /etc/systemd/system/

RUN dnf --enablerepo=plus -y install openldap-servers openldap-clients \
 && cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG \
 && chown ldap. /var/lib/ldap/DB_CONFIG \
 && systemctl enable slapd \
 && systemctl enable slapd-setup

COPY init.ldif /tmp/
COPY setup.ldif /tmp/
COPY start.sh /tmp/

ENTRYPOINT [ "/sbin/init" ]
